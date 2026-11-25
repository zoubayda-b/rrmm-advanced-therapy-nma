# Search exports and query log

Everything in this folder is **immutable input**. Never edit a file here; if a
search is wrong, add a new dated export and supersede the old one.

## Why the query log matters

Gate G3 of the brief is that a reviewer can **re-run the search from the saved
query**. That is impossible if the query only exists in your browser history.
So every search produces two files:

1. the raw export (`.ris`, `.nbib`, `.csv`) exactly as the database gave it, and
2. one row in `search-log.csv`.

## `search-log.csv`

| Column | Meaning |
|---|---|
| `search_id` | `s001`, `s002`, … in the order run |
| `date_run` | ISO date the search was executed |
| `database` | `PubMed`, `Embase`, `CENTRAL`, `ClinicalTrials.gov`, `hand-search` |
| `query` | The **full** query string, verbatim, in the database's syntax |
| `filters` | Date limits, language limits, design filters |
| `records` | Number of records returned |
| `file` | Filename of the raw export in this folder |
| `notes` | Anything needed to reproduce it |

## Rules

- Run all database searches **on the same day** so the data cut is coherent.
- Never hand-edit an export.
- Hand-searches (ASH/ASCO/EHA abstracts, press releases) are logged too, with the
  conference/year in `database` and the URL in `notes`.
