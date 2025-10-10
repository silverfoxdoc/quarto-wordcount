test_that("counting with note-based citation works with custom cross references", {
  test_file <- test_file_parts(here::here("tests/testthat/test-notes-citation-crossref-custom.qmd"))
  csl_file <- test_file_parts(here::here("tests/testthat/csl/chicago-notes-bibliography.csl"))
  
  create_local_quarto_project(test_file = test_file, csl_file = csl_file)
  
  quarto::quarto_render(input = test_file$qmd, quiet = TRUE)
  
  counts <- get_wordcounts(test_file$md)

  expect_equal(counts$wordcount_appendix_words, 0)
  expect_equal(counts$wordcount_body_words, 15)
  expect_equal(counts$wordcount_note_words, 34)
  expect_equal(counts$wordcount_ref_words, 34)
  expect_equal(counts$wordcount_total_words, 83)
})
