test_that("terminal output is correct; no appendix, no notes", {
  test_file <- test_file_parts(here::here("tests/testthat/test-terminal-output-no-app-notes.qmd"))

  create_local_quarto_project(test_file = test_file)

  actual_output <- capture.output(
    quarto::quarto_render(input = test_file$qmd, quiet = FALSE)
  ) |> extract_output()

  true_output <- "Manuscript totals:
---------------------------------------
- 40 words (text + notes + references)
- 6 words (text + notes)

Specific totals:
---------------------------------------
- 6 words in text body
- 34 words in references

Overall totals:
---------------------------------------
- 40 words in entire document
"

  expect_equal(actual_output, true_output)
})

test_that("terminal output is correct; all sections", {
  test_file <- test_file_parts(here::here("tests/testthat/test-terminal-output-all-sections.qmd"))

  create_local_quarto_project(test_file = test_file)

  actual_output <- capture.output(
    quarto::quarto_render(input = test_file$qmd, quiet = FALSE)
  ) |> extract_output()

  true_output <- "Manuscript totals:
--------------------------------------------------
- 42 words (text + notes + references)
- 8 words (text + notes)
- 47 words (text + notes + appendix + references)

Specific totals:
--------------------------------------------------
- 6 words in text body
- 2 words in notes
- 34 words in references
- 5 words in appendix

Overall totals:
--------------------------------------------------
- 47 words in entire document
"

  expect_equal(actual_output, true_output)
})

test_that("terminal output is correct; singular 'word' works", {
  test_file <- test_file_parts(here::here("tests/testthat/test-terminal-output-single-word.qmd"))

  create_local_quarto_project(test_file = test_file)

  actual_output <- capture.output(
    quarto::quarto_render(input = test_file$qmd, quiet = FALSE)
  ) |> extract_output()

  true_output <- "Manuscript totals:
--------------------------------------
- 5 words (text + notes + references)
- 5 words (text + notes)

Specific totals:
--------------------------------------
- 4 words in text body
- 1 word in notes

Overall totals:
--------------------------------------
- 5 words in entire document
"

  expect_equal(actual_output, true_output)
})

test_that("terminal output includes abstract line", {
  test_file <- test_file_parts(here::here("tests/testthat/test-terminal-output-abstract.qmd"))

  create_local_quarto_project(test_file = test_file)

  actual_output <- capture.output(
    quarto::quarto_render(input = test_file$qmd, quiet = FALSE)
  ) |> extract_output()

  true_output <- "Manuscript totals:
--------------------------------------
- 4 words (text + notes + references)
- 4 words (text + notes)

Specific totals:
--------------------------------------
- 4 words in text body

Overall totals:
--------------------------------------
- 8 words in entire document
- 4 words in abstract
"

  expect_equal(actual_output, true_output)
})
