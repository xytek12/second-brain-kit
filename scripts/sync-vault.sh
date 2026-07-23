#!/usr/bin/env bash
# Sync the vault via git: rebuild MAP.md, refuse secret-like staged paths, commit,
# pull --rebase, push. Works on macOS/Linux and Windows Git Bash. No hardcoded paths.
set -e

VAULT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$VAULT"

# --- refuse to sync secret-like paths (defence in depth over .gitignore) --------------
check_secret_paths() {
  local blocked
  blocked=$(git status --porcelain --untracked-files=all | sed 's/^...//' \
    | grep -E '(^|/)\.env(\.|$)|(^|/)secrets?/|\.(key|pem|pfx|p12)$|_secret|credential' || true)
  if [ -n "$blocked" ]; then
    echo "Refusing to sync — secret-like paths are staged:"
    echo "$blocked" | sed 's/^/  /'
    exit 2
  fi
}

echo "Syncing vault..."
bash "$VAULT/scripts/build-map.sh" || echo "Warning: MAP.md regeneration failed (continuing)"

check_secret_paths

# Stage tracked edits + known-safe content dirs. Deliberately NOT `git add -A`.
git add -u
for d in wiki projects scripts INDEX.md MAP.md .gitignore; do
  [ -e "$d" ] && git add -- "$d" 2>/dev/null || true
done

check_secret_paths

if git diff --cached --quiet; then
  echo "Nothing new to commit locally"
else
  MACHINE=$(hostname -s 2>/dev/null || hostname)
  git commit -m "sync: $(date '+%Y-%m-%d %H:%M') [$MACHINE]"
fi

# Pull + push. Handle three cases: upstream set, remote-but-no-upstream (first push),
# and no remote at all.
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)
if git rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
  before=$(git rev-parse '@{u}')
  git pull --rebase --autostash
  after=$(git rev-parse '@{u}')
  if [ "$before" != "$after" ]; then
    echo ""
    echo "Pulled $(git rev-list --count "$before".."$after") new commit(s):"
    git log --format='   - %s' "$before".."$after"
  else
    echo "Nothing new from remote"
  fi
  git push
elif git remote get-url origin >/dev/null 2>&1; then
  echo "First push — setting upstream to origin/$branch"
  git push -u origin "$branch"
else
  echo "No remote set — committed locally only."
  echo "  Add one with:  git remote add origin <url> && git push -u origin $branch"
fi

echo "Vault synced"
