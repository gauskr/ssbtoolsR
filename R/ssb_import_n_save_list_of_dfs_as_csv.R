#' SSB import and create file by tabnumber and filetype
#'
#' @param tabnum_list A vector of type character, with numbers corresponding to SSB/statbank-tables. written as character string, referring to a SSB-table in SSBs statbank.
#' @param file A path to, and name of, txt-file containing table numbers (one per row) for SSB/statbank - tables.
#' @return
#' @export

ssb_import_n_save_list_of_dfs_as_csv <- function(tabnum_list = NULL, file = NULL) {
  ssb_import_n_save_list_of_dfs_as_csv_internal(tabnum_list = tabnum_list, file = file)
}
