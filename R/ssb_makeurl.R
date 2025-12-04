#' SSB makeurl
#'
#' @param tablenr A number (written as character string) referring to a SSB-table in SSBs statbank.
#' @return A char vector of length one with the corresponding webadress (api) of the table.
#' @export

ssb_makeurl <- function(tablenr) {
  str_c("https://data.ssb.no/api/v0/en/table/", tablenr, "/", collapse = "")
}
