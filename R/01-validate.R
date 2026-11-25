# =============================================================================
# R/01-validate.R — assertions that the data layer is internally coherent
#
# Inputs  : data/studies.csv, data/arms.csv, data/outcomes.csv, data/rob.csv
# Outputs : none. Fails loudly, or writes outputs/tables/validation-log.txt
# Gate G2 : "validation passes; every number traceable; data dictionary complete"
# Unlock  : Phase 4 — after the protocol is frozen at protocol-v1.0
#
# Why a separate script: a data error caught here costs minutes; the same error
# caught after the NMA costs the whole analysis. This is the cheapest insurance
# in the project.
# =============================================================================

# TODO (Phase 4): implement. Keep the signature so _targets.R can call it.
validate_data <- function(studies, arms, outcomes, rob, treatments) {
  stop("Not implemented — Phase 4. Freeze the protocol first (see reports/protocol.qmd).")
}

# The contract, check by check (mirrors data/data-dictionary.md):
#
#  1. every trial has >= 2 arms                     nrow(filter(arms, study_id == s)) >= 2
#  2. sum(n_randomised) per trial equals the total  reported in the publication
#  3. ci_low <= effect <= ci_high                   for every row that has an effect
#  4. effect > 0 for HR and OR                      log-scale measures cannot be <= 0
#  5. exactly one primary PFS row per trial         duplicated primary endpoints are fatal
#  6. every treatment %in% treatments               the vocabulary in R/00-setup.R
#  7. no duplicate study_id x arm_id x outcome      one number per cell
#  8. units consistent within a column              months vs weeks, % vs proportion
#  9. abstract_only rows are flagged and countable  so the sensitivity analysis can find them
# 10. network_role %in% c("primary","backbone")     so the backbone sensitivity is reproducible
#
# Two further checks worth adding once the data exist:
#  - every `arm_id` in outcomes.csv exists in arms.csv   (referential integrity)
#  - every `study_id` in arms.csv exists in studies.csv
