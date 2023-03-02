#' Function to play hi-ho cherry-o!
#'
#' This function simulates hi-ho cherry-o using the standard spinner but
#'   allow the user to change the size of the cherry tree.
#'
#' @param tree A integer value indicating the size of the tree.
#' @param max_game The maximum number of spins that are allowed before the
#'   game suspends.
#'
#' @returns An object of class 'cherry' which stores the number of spins
#'   in the game along with the progression of the game stored as an attribute.
#'
#' @export
play_game <- function(tree, max_game = 1e5) {

  if(!is.numeric(tree)) stop(paste("tree must be numeric, not", class(tree)))
  if(tree %% 1 != 0){
    warning("Decimal value detected for tree input, coercing to integer")
    tree <- as.integer(tree)
  }
  if(tree > 50){
    message("You are crazy for wanting to play the game with such a large
            cherry tree!")
  }
  # Set the "starting" variables for the game
  tree_current <- vector("numeric", max_game + 1)
  tree_current[1] <- tree
  basket <- 0

  # Now, play the game. Write a conditional statement that suspends the loop
  # once the number of cherries on the tree drops to zero.
  for(i in seq_len(max_game)) {

    # Use +1 since the initial grid is stored in index 1
    tree_current[i + 1] <- spinner(tree_current[i], basket)
    basket <- tree - tree_current[i + 1]

    # Use < instead of == to avoid any numerical precision issues around 0.
    if(tree_current[i + 1] < 0.0001){
      break
    }
  }

  # BONUS: Add warning statement if game finished to complete.
  if(i == max_game){
    warning("Game not finished before max_game reached")
  }

  game_moves <- diff(tree_current[seq_len(i + 1)])

  # Return the number of iterations it took to finish the game. Return as the
  # cherry class (see generics.R).
  as_cherry(i, tree = tree, game_diff = game_moves)
}

#' The spinner in the game hi-ho cherry-o.
#'
#' @param tree An integer value specifying the current number of cherries
#'   on the tree.
#' @param basket An integer value specifying the current number of cherries
#'   in the basket.
#'
#' @return An integer value specifying the number of cherries left on the tree.
#' @export
spinner <- function(tree, basket) {

  bird_dog <- -min( c(2, basket) )

  move <- sample(c(1:4, rep(bird_dog, 2), -basket), size = 1)

  left <- tree - move

  max(left, 0)
}


