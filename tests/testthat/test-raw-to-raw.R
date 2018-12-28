context("test-raw-to-raw")

test_that("raw_to_raw works", {
  raw_vec <- as.raw(1:20)
  expect_identical(raw_vec, raw_to_raw(raw_vec))
})
