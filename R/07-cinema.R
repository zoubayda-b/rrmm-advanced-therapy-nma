# =============================================================================
# R/07-cinema.R — RoB 2 judgements and CINeMA certainty ratings
#
# Inputs  : data/rob.csv, outputs/tables/nma-*.csv
# Outputs : outputs/figures/rob-*.png, outputs/tables/cinema.csv
# Gate G4b: "every CINeMA judgement traceable to RoB or extraction; certainty
#            table complete"
# Unlock  : Phase 10
#
# A ranking without a certainty judgement is the most common way this kind of
# project loses credibility. This script is the antidote.
# =============================================================================

# TODO (Phase 10).
#
#  1. RoB 2 for PFS, OS and response, per trial. robvis traffic-light + summary.
#  2. CINeMA for: cilta-cel vs SOC, tec-dara vs SOC, elranatamab vs SOC,
#     Tal-DP vs SOC, Tec-Tal vs SOC.
#  3. CINeMA domains: within-study bias, reporting bias, indirectness,
#     imprecision, heterogeneity, incoherence. Each judgement cites its evidence.
#  4. build the certainty table with footnotes.
#  5. red-team: which comparison is lowest certainty, and why.
#
# Abstract-only trials (MagnetisMM-5, MonumenTAL-6) cannot escape a
# reporting-bias concern. Say so explicitly rather than rating them "low" silently.

build_certainty_table <- function(rob, nma_results) {
  stop("Not implemented — Phase 10.")
}
