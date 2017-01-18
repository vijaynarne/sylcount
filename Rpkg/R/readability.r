#' readability
#' 
#' Computes some basic "readability" measurements, namely Flesch reading ease
#' and Flesch-Kincaid grade level.  The function is vectorized.
#' 
#' @details
#' The return is split into words and non-words.  A non-word is some block
#' of text more than 64 characters long with no spaces or sentence-ending
#' punctuation inbetween.  The number of non-words is returned mostly
#' for error-checking/debugging purposes.  If you have a lot of 
#' non-words, you probably didn't clean your text properly.  The word/non-word
#' division is made in an attempt to improve run-time and memory performance.
#' 
#' For implementation details, see the Details section of \code{?sylcount}.
#' 
#' @return
#' A dataframe containing:
#' \tabular{ll}{
#'   \code{words}         \tab text tokens that are probably English language words \cr
#'   \code{nonwords}      \tab text tokens that are probably not English language words \cr
#'   \code{sentences}     \tab the number of sentences recognized in the text \cr
#'   \code{syllables}     \tab the total number of syllables (ignores all non-words) \cr
#'   \code{reading.ease}  \tab Flesch reading ease score \cr
#'   \code{grade.level}   \tab Flesch-Kincaid grade level score \cr
#' }
#' 
#' @param s
#' A character vector (vector of strings).
#' 
#' @references
#' Kincaid, J. Peter, et al. Derivation of new readability formulas (automated
#' readability index, fog count and flesch reading ease formula) for navy
#' enlisted personnel. No. RBR-8-75. Naval Technical Training Command
#' Millington TN Research Branch, 1975.
#' 
#' @examples
#' library(sylcount)
#' a <- "I am the very model of a modern major general."
#' b <- "I have information vegetable, animal, and mineral."
#' 
#' readability(a)
#' 
#' # One at a time
#' readability(c(a, b))
#' # Both at once
#' readability(paste0(a, b, collapse=" "))
#' 
#' @seealso \code{\link{sylcount}}
#' @export
readability <- function(s) .Call(R_readability, s)