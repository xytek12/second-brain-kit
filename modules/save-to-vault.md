# Module: save-to-vault

Adds a **`save project`** command: snapshot the current project into the vault and write a
HANDOFF so any machine or agent can resume it.

## When the user says "save project" / "save to vault"
1. Create `projects/<project-name>/` in the vault.
2. Write `HANDOFF.md` from `templates/project-handoff.tmpl` — be exact about where work
   stopped and the next steps.
3. Mirror the project's **text** files (code, docs, plans). **Exclude** secrets
   (`.env*`, keys), `node_modules/`, build output, and heavy binaries.
4. Add/refresh a row in the INDEX Project Router (name · status · note · location).
5. Run `sync vault` to commit + push.

## Why it's good
The vault becomes a portable handoff system: stop on one machine, `sync vault`, pull on
another, open the HANDOFF, continue — with full context and zero secrets in transit.
