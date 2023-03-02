test_that("check errors and warnings", {
  tree_size <- sample(5:30, 1)
  # Create a set of "starting points" for the spinner.
  tree_start <- sample(1:tree_size, size = 100, replace = TRUE)

  turns <-

  # Run the spinner from some arbitrary starting points, that have been
  # randomly sampled. Store what is "left" on the tree for each
  # arbitrary starting point.
  spinner_store <- vector("numeric", length(start))
  for(i in seq_len(length(tree_start))){
    spinner_store[i] <- spinner(tree_start[i], tree_size - tree_start[i])
  }

  expect_warning(tree_start > 50)

  expect_warning(turns > 1e5)

  expect_warning()
})
