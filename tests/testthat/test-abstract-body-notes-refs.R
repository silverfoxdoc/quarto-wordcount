test_that("abstract is counted separately from body, notes, and refs", {
  test_file <- test_file_parts(here::here("tests/testthat/test-abstract-body-notes-refs.qmd"))

  create_local_quarto_project(test_file = test_file)

  quarto::quarto_render(input = test_file$qmd, quiet = TRUE)

  counts <- get_wordcounts(test_file$md)

  expect_equal(counts$wordcount_abstract_words, 5)
  expect_equal(counts$wordcount_body_words, 6)
  expect_equal(counts$wordcount_note_words, 4)
  expect_equal(counts$wordcount_ref_words, 34)
  expect_equal(counts$wordcount_appendix_words, 0)
  # Total should be abstract + body + notes + refs
  expect_equal(counts$wordcount_total_words, 49)
})
