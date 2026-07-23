#!/usr/bin/env bash
# Link skills kept INSIDE the vault (vault/skills/*) into the agent skill dir(s), so they
# travel with the vault. Per-machine; run once after cloning. Idempotent.
#   Usage: link-skills.sh [claude|codex|both]   (default: both, whichever dirs exist)
set -e

VAULT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$VAULT/skills"
TARGET="${1:-both}"

[ -d "$SRC" ] || { echo "No vault/skills/ folder — nothing to link."; exit 0; }

link_into() {
  local dest="$1" label="$2"
  mkdir -p "$dest"
  local n=0
  for skill in "$SRC"/*/; do
    [ -d "$skill" ] || continue
    local name; name="$(basename "$skill")"
    rm -rf "$dest/$name" 2>/dev/null || true
    # Prefer a symlink; fall back to copy (e.g. Windows without symlink perms).
    if ln -s "$skill" "$dest/$name" 2>/dev/null; then :; else cp -r "$skill" "$dest/$name"; fi
    n=$((n+1))
  done
  echo "🔗 linked $n skill(s) → $label ($dest)"
}

case "$TARGET" in
  claude) link_into "$HOME/.claude/skills" "Claude" ;;
  codex)  link_into "$HOME/.agents/skills" "Codex" ;;
  both)
    link_into "$HOME/.claude/skills" "Claude"
    link_into "$HOME/.agents/skills" "Codex"
    ;;
  *) echo "Usage: link-skills.sh [claude|codex|both]"; exit 1 ;;
esac
