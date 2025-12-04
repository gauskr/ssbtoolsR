#' SSB import and create file by tabnumber and filetype
#'
#' @importFrom stringr str_c
#' @importFrom utils write.csv
#' @param tablenr A number, written as character string, referring to a SSB-table in SSBs statbank.
#' @param filetype A character string, currently either "csv" or "RDS", which selects the type of file to be saved.
#' @param size An integer which controls the number of Regions to be imported at once.
#' @param sys_sleep An integer which controls how long the computer 'sleeps' before importing the next chunk of data.
#' @return A file, either .csv or RDS, with the data from the table.
#' @export


ssb_import_n_create_file_by_tabnum <- function(tabnum, filetype = "csv", size = 10, sys_sleep = 2) {
  d <- ssb_giga_pull(tabnum, size = size, sys_sleep = sys_sleep)
  if (filetype == "csv") {
    newname <- stringr::str_c("ssb_", tabnum, ".csv")
    write.csv(d, newname)
  } else if (filetype == "RDS") {
    newname <- stringr::str_c("ssb_", tabnum, ".RDS")
    saveRDS(d, newname)
  }
}
