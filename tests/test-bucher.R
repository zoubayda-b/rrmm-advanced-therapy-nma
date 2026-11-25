# =============================================================================
# tests/test-bucher.R
#
# Run with:  testthat::test_file("tests/test-bucher.R")
# Gate G3a: "hand and code agree"
#
# Write these tests BEFORE the function works. That is the point of them.
# =============================================================================

library(testthat)
source(here::here("R", "03-bucher.R"))

test_that("bucher() reproduces a hand calculation", {
  skip("Phase 6 — bucher() not implemented yet.")

  # Worked example (fill in with real numbers from the pairwise phase):
  #   A vs B (through DPd): log HR = log(0.26), SE = ...
  #   B vs C             : log HR = log(0.49), SE = ...
  #   by hand: d_ac = d_ab - d_bc, se_ac = sqrt(se_ab^2 + se_bc^2)
  #
  # expect_equal(res$est, expected_est, tolerance = 1e-6)
  # expect_equal(res$se,  expected_se,  tolerance = 1e-6)
})

test_that("bucher() errors on a missing standard error", {
  skip("Phase 6 — decide the error contract first.")
})

test_that("bucher() returns a CI that contains the point estimate", {
  skip("Phase 6 — property test: true for any finite inputs.")
})
