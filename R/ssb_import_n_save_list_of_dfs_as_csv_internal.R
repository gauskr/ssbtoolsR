ssb_import_n_save_list_of_dfs_as_csv_internal <- function(tabnum_list = NULL, file = NULL) {
  if (is.null(tabnum_list) & is.null(file)) {
    rlang::abort("You need either:\nA character vector:\nssb_import_n_save_list_of_dfs_as_csv(c(\"04936\", \"04689\", \"06400\"))\nor a txt-file with numbers to be imported:\nssb_import_n_save_list_of_dfs_as_csv(file = \"myfile_w_tabnums.txt\")\nUse only one of the options.")
  } else if (!is.null(file) & !is.null(tabnum_list)) {
    rlang::abort("I said: only use one of ze options.\n......\nJeeez.\nAnyhow, that means only one of the following arguments within the ()s:\nEITHER file = mylist.txt OR tabnum_list = c(\"whatevertabnum\",\"39457\").\nGood luck with the next one.\nYou kick ass, so it should be fine.")
  }

  if (!is.null(file)) {
    tabnum_list <- readLines(file)
    tabnum_list2 <- stringr::str_squish(tabnum_list)
  } else {
    tabnum_list2 <- tabnum_list
  }
  n_dfs <- length(tabnum_list2)
  for (i in 1:n_dfs) {
    ssb_import_n_create_file_by_tabnum(tabnum_list2[i])
  }
}
