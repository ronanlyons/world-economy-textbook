# Textbook build folder

**Book:** *The World Economy over the Very Long Run — A History in Data and Debates*
(open-access course textbook; see ../textbook_plan.md).

## Render
Requires the **Quarto CLI** (not yet installed; R 4.3.1 is present). Once installed:

    quarto render            # HTML (open-access site) + PDF + EPUB
    quarto preview           # live HTML preview

## Layout
- `_quarto.yml` — book structure (5 parts, 12 chapters, 3 appendices).
- `index.qmd` — preface.
- `00-introduction.qmd`, `02-first-world-system.qmd` — first-draft PILOTS (set the template).
- `01,03..11` + `appendix-*` — stubs to draft from the module design corpus.
- `_chapter-template.qmd` — the standardized chapter template (apparatus standardized, narrative free).
- `references.bib` — to be consolidated from the ten deck refs.bib (verified DOIs only).
- `style/world-economy.scss` — house palette (blue = ECU4413).
- `figures/`, `data/` — generated figures and downloadable datasets for the exercises.
