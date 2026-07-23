# Interview — tailoring the vault

Ask these **one at a time**, prefer multiple choice, and let the user answer in **Hebrew or
English** — match their language back. Capture every answer; it drives the scaffold.

The goal of this interview is not just to fill a template. It is to **understand the person**,
so that in future sessions the agent already knows who they are and the loaded context can stay
small. Two ways to learn about them: **read what already exists**, and **ask**. Do the reading
first — it saves the user the most typing.

If the `grill-me` / `brainstorming` skills are installed and the user chose the deeper pass, run
the open questions through them. Otherwise ask plainly.

---

## Part 1 — Get to know the user

### 1a. Read what already exists (do this first)

Ask: *"Do you already have notes, code, projects, or docs I could read to understand you? Point
me at any folders, repos, or files — paths are fine — and I'll read them myself and pre-fill a
lot of this instead of making you type it."*

Then, for whatever they point at:
- Read it **read-only**. Skim structure, READMEs, HANDOFFs, note titles, recent work.
- **Respect privacy:** skip anything that looks like a secret (`.env`, keys, credentials, private
  exports). If something looks sensitive, ask before opening it.
- Summarize back what you learned — *"Here's what I picked up about you and your projects…"* —
  and let them correct it. Use it to pre-seed `wiki/` areas and `projects/` stubs.

This is the highest-leverage step: the more the agent learns here, the less the user repeats later.

### 1b. About the user

Ask only what you couldn't infer from reading. Keep it conversational, one at a time:

- **Name** — what should I call you?
- **Work** — what do you do? Role, field, and what you're good at (your expertise).
- **Stack & tools** — what do you use day to day (languages, frameworks, apps, services)?
- **Languages** — which language(s) for your notes, and which programming languages?
- **Interests & hobbies** — things outside work worth knowing (so the brain can hold personal
  context too, not only projects).
- **Goals** — what are you working toward right now, over the next while?
- **How you like to work with me** — short and direct, or detailed and thorough? Preferred
  language for replies?
- **Off-limits** — anything I should *not* store or ask about (privacy boundaries)?

### 1c. Projects, past and present

- **Active projects** — name, one line each, and where each lives (path or repo). Offer again:
  *"point me at the folder and I'll read it to write the note."*
- **Past projects worth keeping** — what you built and what you learned that's still useful.

Seed a `projects/<name>/` stub with a `HANDOFF.md` for each, and a router row in `INDEX.md`.

---

## Part 2 — Shape the vault

### 2a. Location & name
Where should the vault live, and what should it be called? (Default: a `second-brain` folder in
the home or Documents directory.) Capture the absolute path.

### 2b. Obsidian or plain markdown
- **Obsidian** → `[[wikilinks]]` + a minimal `.obsidian/` config (see `modules/obsidian.md`).
- **Plain** → relative `[markdown](links)`. Everything else is identical.

### 2c. Which agent(s)
**Claude, Codex, or both** — sets the SessionStart hook target(s) and where `link-skills.sh`
links skills.

### 2d. Life + work areas
Confirm the main areas (many may already come from Part 1) — 3–7 areas, one seed note each in
`wiki/`. These also head the INDEX "Who / areas" section.

### 2e. Sync + backup → offer a private GitHub repo
Ask how they want to sync between machines and back up. **Recommend a private GitHub repo** and
explain how, plainly:

- **Private GitHub repo (recommended).** Keeps the vault backed up off your machine and synced
  everywhere — and **private**, so your personal notes stay yours.
  - If they have the GitHub CLI (`gh`): from inside the vault run
    `gh repo create <name> --private --source=. --remote=origin --push`. That creates the repo
    **as private** and pushes in one step.
  - If they prefer the website: go to github.com → **New repository** → set **Private** → create
    the empty repo, then `git remote add origin <url> && git push -u origin main`.
  - **Ask them to create/authorize it** (you can't create a repo on their account for them) — or
    confirm they're happy for you to run the `gh` command on their behalf.
- **Other git remote** — they paste any git URL; `git remote add origin <url>`.
- **Local git only** — version history, no remote (a remote can be added later).

### 2f. Language
Default language for the vault — English, Hebrew, or bilingual. For Hebrew, write RTL and native.

### 2g. Opt-in modules
Offer any of: **save-to-vault** (one-command project handoffs), **digest** (`raw/ → wiki/` loop),
**size-gate hook** (blocks big binaries from git). Obsidian is handled in 2b.

---

## After the interview
Summarize everything back in one block — who they are, their areas/projects, and the vault
choices — and get a yes. Then build per SKILL.md step 3+.
