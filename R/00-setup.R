# =============================================================================
# R/00-setup.R
#
# Purpose : one place that defines paths, packages, plotting defaults, the RNG
#           seed and the treatment vocabulary used everywhere else.
# Sourced : at the top of every analysis script. Never writes to data/.
# Gate    : sourcing this file twice in a row must not error or change state.
# =============================================================================

# --- Reproducibility ---------------------------------------------------------
# .Rprofile activates renv, so `library()` below resolves against the project
# library recorded in renv.lock, not against your global R library.
# If a package is missing: renv::restore()
if (!requireNamespace("renv", quietly = TRUE)) {
  stop("renv is not available. Run renv::restore() from the project root.")
}

options(
  stringsAsFactors = FALSE,
  scipen           = 999,          # never print 1e-05 in a results table
  dplyr.summarise.inform = FALSE
)

# --- Paths -------------------------------------------------------------------
# here() anchors to the project root (the folder containing .Rproj or .git),
# so every script works no matter which directory it is launched from.
library(here)

path_raw       <- here("data", "raw")
path_derived   <- here("data", "derived")
path_figures   <- here("outputs", "figures")
path_tables    <- here("outputs", "tables")
path_reports   <- here("reports")

# Create the write-targets on first run. These are git-ignored on purpose:
# everything in them must be regenerable.
invisible(lapply(
  c(path_derived, path_figures, path_tables),
  dir.create,
  recursive = TRUE, showWarnings = FALSE
))

# --- Packages ----------------------------------------------------------------
# Declared centrally so renv::snapshot() can see every dependency.
# Add a package here AND to renv.lock before using it in a script.

pkgs_core <- c(
  # data handling
  "here", "readxl", "janitor", "dplyr", "tidyr", "stringr", "purrr", "readr",
  # figures and tables
  "ggplot2", "scales",
  # engineering
  "testthat", "targets",
  # reporting
  "knitr", "rmarkdown"
)

# Evidence-synthesis packages are deliberately NOT loaded yet.
# The brief forbids modelling before the protocol is frozen (Phase 2).
# Uncomment each block when its phase begins:
#
#   Phase 5 : "meta", "metafor"
#   Phase 7 : "netmeta"
#   Phase 8 : "gemtc", "multinma", "coda"

missing <- pkgs_core[!vapply(pkgs_core, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing) > 0) {
  message("Installing missing core packages: ", paste(missing, collapse = ", "))
  renv::install(missing)
}

invisible(lapply(pkgs_core, library, character.only = TRUE))

# --- Dependency hints --------------------------------------------------------
# renv discovers dependencies by *static* analysis of the source. The lapply()
# above loads packages dynamically, so a package that nothing else depends on
# looks unused. readxl is the only one in that position (its dependencies,
# cellranger and rematch, are pulled in with it).
#
# These references are never evaluated; they exist so renv::status() is clean.
if (FALSE) {
  readxl::read_excel
}

# --- Plotting defaults -------------------------------------------------------
# One theme for the whole project. Figures in a report should look like they
# came from the same hand.
theme_rrmm <- function(base_size = 12) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      plot.title    = ggplot2::element_text(face = "bold", size = base_size + 1),
      plot.subtitle = ggplot2::element_text(colour = "grey35"),
      plot.caption  = ggplot2::element_text(colour = "grey45", size = base_size - 3),
      legend.position = "bottom"
    )
}
ggplot2::theme_set(theme_rrmm())

# --- Random seed -------------------------------------------------------------
# Only the Bayesian phase (Phase 8) is stochastic, but set it now so the habit
# is in place. The date matches the data cut, so the seed is not arbitrary.
SEED <- 20261115L
set.seed(SEED)

# --- Treatment vocabulary ----------------------------------------------------
# THE most important object in the project.
#
# Every arm in every table must use one of these strings, exactly. The
# validation script (01-validate.R) fails if a treatment is not in this vector.
#
# This is a *scientific* decision, not a coding one: it defines the nodes of the
# network. It is locked at protocol-v1.0 and changed only via the amendments log.
#
# TODO(ZB, Phase 0): confirm or edit, then lock at protocol-v1.0.
treatments <- c(
  # --- advanced-therapy nodes (experimental) ---
  "cilta-cel",            # CARTITUDE-4
  "ide-cel",              # KarMMa-3
  "tec-dara",             # teclistamab + daratumumab          (MajesTEC-3)
  "elranatamab",          # MagnetisMM-5
  "tal-dara-pom",         # talquetamab + daratumumab + pomalidomide (MonumenTAL-3)
  "tal-dara",             # talquetamab + daratumumab          (MonumenTAL-3)
  "tec-tal",              # teclistamab + talquetamab          (MonumenTAL-6)
  "tal-pom",              # talquetamab + pomalidomide         (MonumenTAL-6)

  # --- standard-of-care node(s) ---
  # Primary analysis: ONE composite node. Decomposed sensitivity (Phase 9) uses
  # the individual regimens below instead.
  "SOC-composite",
  "DPd", "PVd", "DVd", "EPd", "Rd", "Kd",

  # --- backbone anchors (decomposed sensitivity only) ---
  "Pd", "Vd"
)

# The reference treatment for the NMA. Changing this changes every reported
# contrast, so it is fixed before any model is fitted.
REFERENCE <- "SOC-composite"

# --- Guard rails -------------------------------------------------------------
stopifnot(
  length(treatments) == length(unique(treatments)),
  REFERENCE %in% treatments
)

message("00-setup.R: ", length(treatments), " treatment nodes, reference = ",
        REFERENCE, ", seed = ", SEED)
