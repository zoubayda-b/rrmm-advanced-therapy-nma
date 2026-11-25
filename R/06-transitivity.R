# =============================================================================
# R/06-transitivity.R — effect modifiers, comparator-node analysis, backbone sensitivity
#
# Inputs  : data/studies.csv, data/derived/nma-input.csv
# Outputs : outputs/tables/transitivity.csv, outputs/tables/comparator-*.csv
# Gate G4a: "a table of assumptions with evidence for and against; the conclusion
#            names the main threat"
# Unlock  : Phase 9
#
# This is the phase that makes the project publishable rather than procedural.
# The network is connected; the patients are not.
# =============================================================================

# TODO (Phase 9).
#
#  1. effect-modifier table by trial: prior lines, anti-CD38 exposure/refractoriness,
#     len-refractory, triple-class exposed, prior BCMA, high-risk cytogenetics,
#     EMD, region, follow-up. (Most columns already exist in studies.csv.)
#  2. assess transitivity qualitatively; name the biggest threat in ONE sentence.
#  3. quantify where possible: subgroup by anti-CD38 status, meta-regression,
#     exclude KarMMa-3.
#  4. backbone sensitivity: add APOLLO, IKARIA-MM, OPTIMISMM, ELOQUENT-3 and
#     decompose DPd / PVd / EPd. Show what changes.
#  5. write "what would falsify this network" and carry it into the report.
#
# Deliverable sentence, of the form:
#   "The estimate for X vs SOC is conditional on the control arms being
#    exchangeable; that assumption fails most visibly in Y, and Z would show it."

build_transitivity_table <- function(studies) {
  stop("Not implemented — Phase 9.")
}
