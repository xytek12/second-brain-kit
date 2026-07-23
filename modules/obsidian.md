# Module: Obsidian layer

Chosen when the user wants to open the vault in **Obsidian**. Everything works without it too;
this just makes the vault a first-class Obsidian graph.

## What to add
1. A minimal `.obsidian/app.json` so Obsidian treats the vault folder as a vault:
   ```json
   { "alwaysUpdateLinks": true, "newLinkFormat": "relative" }
   ```
2. Use `[[wikilinks]]` in notes instead of relative markdown links. Obsidian resolves them by
   note basename, so `[[how-this-works]]` finds `wiki/how-this-works.md` anywhere.
3. Embeds: `![[note]]` or `![[image.png]]` render inline in Obsidian.
4. `.gitignore` already excludes `.obsidian/workspace*` and `.obsidian/cache` (per-machine UI
   state) while keeping shared config.

## Conventions
- One note per topic; link liberally with `[[...]]` — a link to a not-yet-created note is a
  valid "to write later" marker, not an error.
- `MAP.md` and the SessionStart routing work identically; Obsidian is just a nicer viewer.

## Without Obsidian
Skip this module. Notes use relative `[markdown](links)` and the vault is plain files — the
agent side is unchanged.
