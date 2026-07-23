#!/usr/bin/env bash
# Activate this vault's git hooks on THIS machine. core.hooksPath is per-clone (not synced),
# so run once on each machine after cloning. Safe if there are no hooks yet.
set -e

VAULT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$VAULT"

if [ -d "$VAULT/scripts/hooks" ] && ls "$VAULT/scripts/hooks"/* >/dev/null 2>&1; then
  git config core.hooksPath scripts/hooks
  chmod +x "$VAULT/scripts/hooks"/* 2>/dev/null || true
  echo "OK — git hooks active (core.hooksPath=scripts/hooks)"
else
  echo "No hooks in scripts/hooks/ — nothing to activate (that's fine)."
fi
