# =============================================================================
# R/04-nma-frequentist.R — network meta-analysis with netmeta
#
# Inputs  : data/derived/nma-input.csv  (treat1, treat2, TE, seTE, studlab)
# Outputs : outputs/tables/nma-*.csv, outputs/figures/network.png, forest, league
# Gate G3b: "diagnostics complete; consistency results interpreted, not just printed"
# Unlock  : Phase 7
# =============================================================================

# TODO (Phase 7). Steps, in order:
#
#  1. build the netmeta dataset: one row per *contrast*, not per arm.
#     A 3-arm trial contributes 3 rows and its comparisons are NOT independent.
#  2. netgraph(): identify multi-arm trials and disconnected components.
#     A disconnected network cannot be meta-analysed. Check before fitting.
#  3. fit common-effect and random-effects; state the primary model in advance.
#  4. multi-arm covariance: covariance = "CS" (compound symmetry) or "HCS"
#     (heterogeneous). Write one sentence justifying the choice.
#  5. forest vs SOC, league table, P-scores WITH the caveat that P-scores are
#     not a ranking of clinical superiority.
#  6. consistency: netsplit(), decomp.design(), netheat().
#  7. sensitivity: exclude KarMMa-3, exclude high RoB, composite vs decomposed.
#  8. sanity check: where an edge is a single trial, the NMA direct estimate must
#     reproduce that trial's published estimate. If it does not, the data are wrong.
#
# Do NOT report a ranking before the certainty table exists.

run_nma_frequentist <- function(nma_input, reference = "SOC-composite") {
  stop("Not implemented — Phase 7.")
}
