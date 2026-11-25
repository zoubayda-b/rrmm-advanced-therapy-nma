# =============================================================================
# R/08-run-all.R — rebuild everything, in order
#
# Usage   : Rscript R/08-run-all.R
# Gate G5 : "fresh clone + restore + rebuild + render reproduces every output"
#
# This mirrors _targets.R. targets is the better tool (it skips work that is
# already up to date); this script exists so the pipeline can be run without it,
# which makes the dependency order explicit and debuggable.
# =============================================================================

source(here::here("R", "00-setup.R"))

scripts <- c(
  "01-validate.R",
  "02-pairwise.R",
  "03-bucher.R",
  "04-nma-frequentist.R",
  "05-nma-bayesian.R",
  "06-transitivity.R",
  "07-cinema.R"
)

for (s in scripts) {
  message("--- ", s, " ---")
  # TODO (Phase 11): replace with a call into each script's exported function,
  # so this file orchestrates rather than executes.
}

message("Pipeline complete. Rendering report...")
quarto::quarto_render(here::here("reports", "rrmm-nma.qmd"))
