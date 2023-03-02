test_that("spinner counts stay in bounds", {
  tree_size <- sample(5:30, 1)
  # Create a set of "starting points" for the spinner.
  tree_start <- sample(1:tree_size, size = 100, replace = TRUE)

  # Run the spinner from some arbitrary starting points, that have been
  # randomly sampled. Store what is "left" on the tree for each
  # arbitrary starting point.
  spinner_store <- vector("numeric", length(start))
  for(i in seq_len(length(tree_start))){
    spinner_store[i] <- spinner(tree_start[i], tree_size - tree_start[i])
  }

  # Make sure the number of cherry's left on the tree
  # stays in bounds.
  expect_true(max(spinner_store) <= tree_size)
  expect_true(min(spinner_store) >= 0)
})



test_that("check for proper error/warning/message handling", {
  expect_error(play_game("10"), "tree must be numeric, not")
  expect_warning(play_game(10.1), "Decimal value detected for tree input")

  # Idea for "quietly" functional from:
  # https://stackoverflow.com/questions/66547934/how-to-mute-messages-and-warnings-with-testthat-when-they-are-expected
  play_quiet <- purrr::quietly(play_game)
  play_catch <- play_quiet(51, max_game = 5)
  expect_true(regexpr(pattern = "You are crazy", play_catch$messages) > 0)
  expect_true(regexpr(pattern = "Game not finished", play_catch$warnings) > 0)
})

test_that("class attributes correct", {
  tree <- sample(5:15, size = 1)
  result <- play_game(tree)

  expect_equal(attr(result, "tree"), tree)
  expect_true(max(attr(result, "game_diff")) <= tree - 1)
  expect_true(min(attr(result, "game_diff")) >= -4)
})
