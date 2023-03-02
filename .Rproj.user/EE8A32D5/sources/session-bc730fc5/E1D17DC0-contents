#' Plot the progression of a high-ho cherry-o game.
#'
#' @param x An object of class 'cherry'
#' @param y Ignored
#' @param ... Additional arguments to [plot.default()].
#'
#' @export
plot.cherry <- function(x, y, ...){
  run <- attr(x, "tree") + cumsum(attr(x, "game_diff"))
  plot(0:length(run), c(attr(x, "tree"), run), ylim = c(0, 10),
       xlab = "Spins", ylab = "On Tree", type = "l", ...)
}
