# Data dictionary

Every variable in `data/studies.csv`, `data/arms.csv`, `data/outcomes.csv` and
`data/rob.csv`, defined once.

**Rule:** a variable that is not defined here cannot appear in a table. If you
need a new variable, add it here first, then to the CSV, then to
`R/01-validate.R`.

---

## `studies.csv` — one row per trial

| Variable | Definition | Unit / allowed values | Source |
|---|---|---|---|
| `study_id` | Short stable identifier, used as a key everywhere | lowercase slug, e.g. `cartitude4` | — |
| `trial_name` | Trial name as published | text | publication |
| `nct` | ClinicalTrials.gov identifier | `NCT########` | registry |
| `phase` | Trial phase | `3`, `2/3` | publication |
| `design` | Randomisation structure | e.g. `2-arm parallel`, `3-arm parallel` | publication |
| `countries` | Countries/regions enrolling | comma-separated | publication |
| `data_cut` | Date of the data cut | ISO date `YYYY-MM-DD` | publication |
| `publication` | Full citation or abstract identifier | text | — |
| `funding` | Sponsor / funder | text | publication |
| `population` | One-line description of the enrolled population | text | publication |
| `prior_lines_min` | Minimum prior lines allowed | integer | eligibility criteria |
| `prior_lines_max` | Maximum prior lines allowed | integer | eligibility criteria |
| `median_prior_lines` | Median prior lines in the analysed set | number | results |
| `len_refractory_pct` | Proportion lenalidomide-refractory | % (0–100) | results |
| `anti_cd38_exposed_pct` | Proportion with any prior anti-CD38 exposure | % (0–100) | results |
| `anti_cd38_refractory_pct` | Proportion anti-CD38-refractory | % (0–100) | results |
| `tce_pct` | Proportion triple-class exposed | % (0–100) | results |
| `prior_bcma_pct` | Proportion with prior BCMA-directed therapy | % (0–100) | results |
| `high_risk_cytogenetics_pct` | Proportion high-risk cytogenetics | % (0–100) | results |
| `emd_pct` | Proportion with extramedullary disease | % (0–100) | results |
| `age_median` | Median age | years | results |
| `follow_up_median` | Median follow-up | months | results |
| `abstract_only` | Data available only as conference abstract / press release | `TRUE` / `FALSE` | — |
| `network_role` | Role in the network | `primary`, `backbone` | — |

## `arms.csv` — one row per arm

| Variable | Definition | Unit / allowed values | Source |
|---|---|---|---|
| `study_id` | Foreign key to `studies.csv` | — | — |
| `arm_id` | Arm identifier unique within trial | text, e.g. `exp`, `ctl`, `exp2` | — |
| `treatment` | Canonical treatment node | **must be in `treatments`** (`R/00-setup.R`) | — |
| `dose_schedule` | Dose and schedule | text | methods |
| `n_randomised` | Number randomised to the arm | integer | results |
| `n_treated` | Number actually treated | integer | results |
| `notes` | Anything a reader would otherwise have to guess | text | — |

## `outcomes.csv` — one row per trial/arm/outcome

| Variable | Definition | Unit / allowed values | Source |
|---|---|---|---|
| `study_id` | Foreign key | — | — |
| `arm_id` | Foreign key | — | — |
| `treatment` | Canonical node (denormalised for convenience) | in `treatments` | — |
| `outcome` | Outcome name | `PFS`, `OS`, `ORR`, `CR_or_better`, `MRD`, `CRS`, `ICANS`, `infection`, `discontinuation` | — |
| `definition` | Exact definition used in this trial | text | publication |
| `timepoint` | Timepoint for binary outcomes | e.g. `12 months` | publication |
| `n` | Analysis-set size for this outcome | integer | publication |
| `events` | Number of events / responders | integer | publication |
| `effect_type` | Which effect measure is recorded | `HR`, `OR`, `RR`, `proportion` | — |
| `effect` | Point estimate (on the analysis scale) | number > 0 | publication |
| `ci_low` | Lower confidence limit | number | publication |
| `ci_high` | Upper confidence limit | number | publication |
| `source_table_figure_page` | Where in the publication the number came from | text, e.g. `Table 2, row PFS` | — |

## `rob.csv` — one row per trial/outcome/domain

| Variable | Definition | Unit / allowed values | Source |
|---|---|---|---|
| `study_id` | Foreign key | — | — |
| `outcome` | Outcome the judgement applies to | as above | — |
| `domain` | RoB 2 domain | `D1`–`D5` | — |
| `judgement` | Domain judgement | `Low`, `Some concerns`, `High` | — |
| `support` | The evidence supporting the judgement | text | publication |

---

## Worked example row

A correctly sourced `outcomes.csv` row looks like this:

```
study_id,arm_id,treatment,outcome,definition,timepoint,n,events,effect_type,effect,ci_low,ci_high,source_table_figure_page
cartitude4,exp,cilta-cel,PFS,Investigator-assessed per IMWG,,,,HR,0.26,0.18,0.38,Table 1 primary endpoint
```

Note what is **not** there: no derived numbers, no p-values, no "approximately".
The point estimate and both limits, each traceable.

## Validation contract

`R/01-validate.R` enforces, at minimum:

1. Every trial has ≥ 2 arms.
2. `sum(n_randomised)` per trial equals the randomised total reported.
3. `ci_low ≤ effect ≤ ci_high` for every row with an effect.
4. `effect > 0` for `HR` and `OR`.
5. Exactly one primary PFS row per trial.
6. Every `treatment` is in `treatments`.
7. No duplicate `study_id` × `arm_id` × `outcome` rows.
8. Units are consistent within a column.
9. `abstract_only == TRUE` rows are flagged and countable.
10. `network_role` ∈ {`primary`, `backbone`}.
