#' SSB makeurl
#'
#' @param tablenr A number (written as character string) referring to a SSB-table in SSBs statbank.
#' @return
#' @export

ssb_makeurl <- function(tablenr) {
  str_c("https://data.ssb.no/api/v0/en/table/", tablenr, "/", collapse = "")
}
