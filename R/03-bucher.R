# =============================================================================
# R/03-bucher.R — indirect comparison through a common comparator, by hand and by code
#
# Inputs  : two direct log effect estimates with SEs (from R/02-pairwise.R)
# Outputs : outputs/tables/bucher-*.csv, reports/bucher-memo.md
# Gate G3a: "hand and code agree; the memo explains anchoring and transitivity"
# Unlock  : Phase 6
#
# The whole method, in three lines:
#
#   d_AC = d_AB - d_BC
#   se_AC = sqrt(se_AB^2 + se_BC^2)
#   CI_AC = exp(d_AC +/- 1.96 * se_AC)
#
# Bucher produces a number. It cannot test consistency. That limitation is the
# reason the project goes on to NMA.
# =============================================================================

# TODO (Phase 6): implement.
#
# bucher(d_ab, se_ab, d_bc, se_bc, level = 0.95)
#   -> tibble(est = d_ac, se = se_ac, ci_low = ..., ci_high = ..., est_exp = exp(d_ac), ...)
#
# Design notes to decide *before* coding:
#   - do you accept log-scale inputs only, or raw HR/OR plus a conversion?
#     (Accept log-scale: one representation, no silent double-logging.)
#   - what happens when an SE is missing? (Error, not a silent NA.)
#   - the function must be pure: same inputs, same output, no printing.
bucher <- function(d_ab, se_ab, d_bc, se_bc, level = 0.95) {
  stop("Not implemented — Phase 6.")
}

# Tests live in tests/test-bucher.R. Write them with the hand calculation.
