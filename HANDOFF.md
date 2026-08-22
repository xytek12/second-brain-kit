# HANDOFF — second-brain-kit

**Last saved:** 2026-07-31 12:48 (Asia/Jerusalem) · **From:** home (Windows) machine
**Saved by:** Claude Code — `orchestrate` / `vault-checkpoint` run

> **Adopted, not worked on.** This project was brought into the vault by a checkpoint run so it
> has a backup. No session worked on it that day, so everything below is **derived from the files
> on disk**, not from working knowledge of where it stopped. Treat the status as unverified and
> read the files before acting.

## What this project is
A distributable **skill** that scaffolds a personal knowledge vault for an AI coding agent (Claude Code or Codex) — INDEX/MAP routing, git sync, skill-linking, optional Obsidian. Ships zero secrets and zero personal data. It is the generalised, shareable form of Gal's own vault.

## Status — where we stopped (be exact)
Complete skill package on disk: SKILL.md, modules/, references/, templates/, and scripts/ (sync-vault.sh, link-skills.sh, install-hooks.sh, pre-commit size gate). Whether it has been published anywhere is not recorded here.

## Not done yet / next steps (in order)
1. Confirm this description against the files — it was written from a file listing, not from working on the project.
2. Replace this stub with a real handoff the next time a session actually works here.

## How to continue (other computer / other AI)
1. Pull the vault: `bash "/c/Users/gal/Documents/Second-Brain/scripts/sync-vault.sh"`
   (work Mac: `bash ~/Documents/Second-Brain/scripts/sync-vault.sh`)
2. The project lives at `Second-Brain/projects/second-brain-kit/`. Copy it to a normal working folder — the vault is transport, not a workspace.
3. Setup / run commands: not established — see Key files.

## Secrets needed (names only — NEVER commit values)
- None identified at adoption time.

## Key files
- `SKILL.md` — the skill entry point
- `README.md` / `README.he.pdf` — English + Hebrew overview
- `modules/` — digest, obsidian, save-to-vault, size-gate
- `templates/` — INDEX, wiki-note, project-handoff, trust-boundary
- `scripts/hooks/pre-commit` — the 1 MB size gate
