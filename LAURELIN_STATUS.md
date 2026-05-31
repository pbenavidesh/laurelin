# LAURELIN Status

Pedagogical book on optimization, kernel methods, and SVR.
Live at: https://pbenavidesh.github.io/laurelin/
Repo: https://github.com/pbenavidesh/laurelin

## Current state (May 2026)

- Scaffold: 5 parts, 24 chapters — complete
- Render: clean (26/26 documents)
- GitHub Pages: live, auto-deploys on push to main
- renv: initialized, R 4.5.2, core dependencies snapshotted
- Skill: _skills/laurelin-writer/SKILL.md installed
- Preface (index.qmd): complete — author's voice, first person

## Chapter status

All 24 chapters: stub only (placeholder structure)

## Active next steps

- [ ] Ch. 1: A Problem Worth Solving — rename title, write content
- [ ] Ch. 12: SVR classical — write after Ch. 1 to calibrate
      depth of Part I chapters

## Key decisions locked

- Two running datasets: vic_elec (time series),
  California Housing subsample (cross-sectional)
- Code: executable R + Python in tabset groups (group="language")
- Callout taxonomy defined in laurelin-writer skill
- Margin references: reference-location and citation-location
  both set to margin in _quarto.yml (pending — add to _quarto.yml)
- Appendices: notation table + math identities only

## Notes

- _quarto.yml still needs reference-location: margin and
  citation-location: margin added to format: html: block
- Chapter 1 title needs renaming from "A Problem Worth Solving"
