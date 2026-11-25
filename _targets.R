# =============================================================================
# _targets.R — pipeline definition
#
# Run with:  targets::tar_make()
# Inspect  : targets::tar_manifest()   (what will run)
#            targets::tar_visnetwork() (dependency graph)
# Gate G5  : a fresh clone runs tar_make() and every output reappears.
#
# targets only re-runs a target when its inputs change, which is what makes
# "one command rebuilds everything" cheap enough to actually do.
# =============================================================================

library(targets)

tar_option_set(
  packages = c("here", "readr", "dplyr", "tidyr", "janitor", "ggplot2"),
  format   = "rds"
)

# ---------------------------------------------------------------------------
# Phase 4 onwards. Uncomment and extend as each phase lands.
# The targets are ordered by dependency, not by line number: targets works that
# out from the object names.
# ---------------------------------------------------------------------------
list(
  # tar_target(studies,  readr::read_csv(here::here("data", "studies.csv"))),
  # tar_target(arms,     readr::read_csv(here::here("data", "arms.csv"))),
  # tar_target(outcomes, readr::read_csv(here::here("data", "outcomes.csv"))),
  # tar_target(rob,      readr::read_csv(here::here("data", "rob.csv"))),
  #
  # tar_target(validated, {
  #   source(here::here("R", "00-setup.R"))
  #   source(here::here("R", "01-validate.R"))
  #   validate_data(studies, arms, outcomes, rob, treatments)
  #   list(studies = studies, arms = arms, outcomes = outcomes, rob = rob)
  # }),
  #
  # tar_target(pairwise,   run_pairwise(validated)),
  # tar_target(bucher_res, run_bucher(pairwise)),
  # tar_target(nma_freq,   run_nma_frequentist(validated)),
  # tar_target(nma_bayes,  run_nma_bayesian(validated)),
  # tar_target(transitivity, build_transitivity_table(validated)),
  # tar_target(certainty,  build_certainty_table(validated, nma_freq)),
  #
  # tar_target(report, {
  #   quarto::quarto_render(here::here("reports", "rrmm-nma.qmd"))
  #   here::here("outputs", "reports", "rrmm-nma.html")
  # }, format = "file")
  NULL
)
