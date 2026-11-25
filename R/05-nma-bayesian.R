# =============================================================================
# R/05-nma-bayesian.R — Bayesian NMA with gemtc, meta-regression with multinma
#
# Inputs  : data/derived/nma-input.csv
# Outputs : outputs/tables/nma-bayes-*.csv, outputs/figures/convergence-*.png
# Unlock  : Phase 8
#
# The point of this phase is not "Bayesian is better". It is to compare the two
# answers and explain any material difference. If they disagree, one of them is
# telling you something about the data.
# =============================================================================

# TODO (Phase 8).
#
#  1. mtc.network(data.re = ...) with the SAME contrasts as the frequentist model.
#  2. mtc.model(..., n.chain = 4, likelihood = "normal", link = "identity",
#               linearModel = "random", hy.prior = mtc.hy.prior("std.dev", "dunif", 0, 5))
#     (the brief asks for a half-normal prior on tau; state exactly what you use)
#  3. mtc.run(n.iter = 20000, thin = ...)
#  4. convergence: gelman.diag(), effectiveSize(), trace plots. Report, do not assume.
#  5. model comparison: DIC / residual deviance. A model that fits worse but is
#     pre-specified stays the primary model.
#  6. sensitivity: alternative priors, fixed vs random.
#  7. optional: multinma for network meta-regression on prior lines and prior
#     anti-CD38 exposure. This is where transitivity stops being a paragraph and
#     becomes a coefficient.
#
# Stochastic: the seed is set in R/00-setup.R (SEED). Do not set it again here.

run_nma_bayesian <- function(nma_input, reference = "SOC-composite") {
  stop("Not implemented — Phase 8.")
}
