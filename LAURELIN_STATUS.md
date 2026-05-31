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

- Ch. 1: From Spreadsheet to Function — ✅ complete
- Chapters 2–24: stub only (placeholder structure)

### Chapter 1

- Status: ✅ Written and published (commit 9cd8c47, cleanup commit TBD)
- Both datasets loaded from CSV (data/vic_elec.csv, data/california_housing.csv)
- Python tabs fixed: vic_elec from CSV, California units documented
- Pending: verify render after data source change

## Active next steps

- [x] Ch. 1: From Spreadsheet to Function — title renamed, content written
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
