# =============================================================================
# R/02-pairwise.R — effect measures and pairwise meta-analysis
#
# Inputs  : data/derived/analysis.csv (validated, Phase 4)
# Outputs : outputs/tables/pairwise-*.csv, outputs/figures/forest-*.png
# Unlock  : Phase 5
#
# The point of this phase is to learn where NMA comes from. If you cannot
# reproduce a single trial's HR from its published CI, you cannot trust the NMA.
# =============================================================================

# --- Conversions (implemented and unit-tested in Phase 5) --------------------
#
#   hr_to_loghr(hr, ci_low, ci_high)  -> list(est = log(hr), se = (log(ci_high) - log(ci_low)) / (2 * qnorm(0.975)))
#
#   Why divide by 2*1.96: the CI is est +/- 1.96*se, so its width is 3.92*se.
#   On the log scale, a 95% CI is symmetric even when the HR scale is not.
#   This is the single most important conversion in the whole project.

# TODO (Phase 5): implement, then hand-check one HR and one OR against the paper.

run_pairwise <- function(analysis) {
  stop("Not implemented — Phase 5.")
}

# Reporting checklist for this phase:
#   - I^2, tau^2 (REML, Paule-Mandel, DerSimonian-Laird), Q, prediction interval
#   - Knapp-Hartung where the number of studies is small
#   - forest plot per outcome, stratified by comparator type
#   - NEVER pool a comparison with one trial: say "not estimable, single trial"
