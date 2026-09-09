# Main Public Output — draft repo

LaTeX source for the Nuffield MPO (grant FR000027016, "Reducing attrition of
more experienced teachers from the workforce"). Structure follows Nuffield's
Guide for Grant-Holders §4.6 and the accessible/technical split used in
Allen et al. (2025) — see the fuller structure guide in the "Nuffield bid"
Claude project (`claude/nuffield-final-report-structure-guide.md`).

## Layout

- `main.tex` — master file, pulls in each section
- `sections/` — one file per report section (see comments in each for what
  Nuffield expects there)
- `references.bib` — bibliography
- `figures/` — plots/images (not tracked in git if large — see note below)

## Building locally

Requires a TeX distribution with `xelatex`, `latexmk`, and `biber` (TeX Live
or MacTeX cover all three). Then:

```
make            # builds main.pdf
make clean      # removes build artifacts
```

## Getting this into Overleaf, with GitHub as the source of truth

This sets up the same local ↔ GitHub ↔ Overleaf loop you've used before.
Since these steps need your own GitHub and Overleaf logins, do them once,
in order:

1. **Create an empty GitHub repo** (e.g. `nuffield-mpo-report`) under your
   personal account or Ambition's org — don't initialise it with a README,
   since this local folder already has one.
2. **Push this local repo to it:**
   ```
   git remote add origin git@github.com:<you-or-ambition>/nuffield-mpo-report.git
   git branch -M main
   git add -A
   git commit -m "Scaffold MPO report structure"
   git push -u origin main
   ```
3. **Import into Overleaf:** New Project → Import from GitHub → pick the
   repo. (This option needs a paid Overleaf plan, which you have.) Overleaf
   will clone it in as a linked project.
4. **Day to day:** edit in Overleaf as normal. Use the GitHub menu inside
   the Overleaf project (top left, next to the project name) to **Push**
   changes back to GitHub and **Pull** changes made locally or by
   collaborators editing the GitHub repo directly. It's a manual push/pull,
   not automatic two-way sync — so get in the habit of pulling before you
   start a local session and pushing before you close an Overleaf session,
   the same way you would with any shared git repo.
5. **Advisory group / Nuffield review rounds:** don't add non-technical
   reviewers as Overleaf editors. Instead export a clean PDF (Overleaf's
   download button, or `make` locally) for each comment round, and fold
   their marked-up feedback back into the source yourself. Keeps LaTeX
   entirely off their plate.

### Alternative: Overleaf's native git bridge (works on any plan)

If you'd rather not route through GitHub's web import, Overleaf also
exposes each project as its own git remote:

```
git clone https://git.overleaf.com/<project_id>
```

(project ID is in the Overleaf project's Git menu). You can add this as a
second remote (`git remote add overleaf ...`) alongside `origin` (GitHub)
and push/pull to both — this is the closer analogue to the git-bridge
workflow if that's what you used previously, rather than Overleaf's GitHub
menu integration.

## Nuffield word/page limits to track while drafting

- Executive summary: standalone, **≤3,000 words**
- Whole report: **25–50 pages excluding appendices**
- Separate 300–400 word "quick read" summary needed near the end (not part
  of this repo yet — add as `sections/quick_read_summary.tex` when ready)

Check word count with `texcount -inc main.tex` locally, or Overleaf's
built-in word count tool (menu → Word Count).
