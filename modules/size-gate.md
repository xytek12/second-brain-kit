# Module: size-gate hook

Keeps the vault git repo **lean** by blocking large files from ever being committed. A vault
is a text base; heavy binaries (renders, videos, RAW photos, zips) bloat git history fast and
are painful to remove later.

## What to do when chosen
1. Ensure `scripts/hooks/pre-commit` is present (it ships with the kit).
2. Run `bash scripts/install-hooks.sh` on each machine — sets `core.hooksPath=scripts/hooks`
   (per-clone, not synced, so it must run once per machine).

## Behaviour
- Any staged file over **1 MB** (tunable via `SECONDBRAIN_SIZE_LIMIT`) blocks the commit with
  a clear message listing the offenders.
- Override for a single intentional commit: `SECONDBRAIN_ALLOW_BIG=1 git commit ...`.

## Why it's good
Bloat is cheap to prevent and expensive to cure — removing a big file already in history means
rewriting every commit and force-pushing. This hook stops the problem at the door. Store heavy
assets outside git (a synced folder, cloud, or an external drive) and keep the vault fast to
clone.
