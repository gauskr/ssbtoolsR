#' SSB Giga pull
#'
#' @param tabnr A number (written as character string) referring to a SSB-table in SSBs statbank.
#' @param size An integer which controls the number of Regions to be imported at once.
#' @param sys_sleep An integer which controls how long the computer 'sleeps' before importing the next chunk of data.
#' @return A data frame (tibble) containing the pulled data.
#' @export

ssb_giga_pull <- function(tabnr, size = 10, sys_sleep = 2) {
  d <- ssb_giga_pull_internal(tabnr = tabnr, size = size, sys_sleep = sys_sleep)
  return(d)
}
