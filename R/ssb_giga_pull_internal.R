ssb_giga_pull_internal <- function(tabnr, size = 10, sys_sleep = 2) {

  pr_import <- size
  url <- ssb_makeurl(tabnr)
  tibtable <- ssb_metatibby(tabnr)
  varnum <- dim(tibtable)[1]
  body1 <- 1:varnum
  varlengths <- map_int(tibtable$values, length)
  splitvar <- (1:length(varlengths))[varlengths == max(varlengths)]
  num_unique_splitvar <- max(varlengths)

  body2 <- str_c("{{tibtable[[1]][", body1, "] = tibtable[[", body1, ",2]][[1]]}}")

  to_be_splitted <- 1:num_unique_splitvar

  iteration_nrs <- tibble(split_vec = to_be_splitted) |>
    mutate(by_import = split_vec %% pr_import,
           is_start = by_import == 1,
           iteration_nr = cumsum(is_start)) |>
    group_by(iteration_nr) |>
    summarise(min = min(split_vec),
              max = max(split_vec)) |>
    mutate(code = str_c(min, ":", max)) |>
    dplyr::select(code) |> unlist()

  iterations <- length(iteration_nrs)

  separate_code <- vector("character", length = iterations)

  for (i in 1:iterations) {
    body_clone <- body2
    body_clone[splitvar] <- str_c(str_remove(body2[splitvar], "\\}\\}"), "[", iteration_nrs[i], "]}}")
    code_chunk <- str_c(body_clone, collapse = ",\n")
    separate_code[i] <- str_c("ApiData12(url,\n", code_chunk, ")")
  }

  list_of_dfs <- vector("list", length = iterations)

  for (i in 1:length(separate_code)) {
    data <- eval(rlang::parse_expr(separate_code[i]))
    list_of_dfs[i] <- list(data)
    Sys.sleep(sys_sleep)
  }

  df1 <- as_tibble(list_of_dfs[1][[1]])
  df2 <- as_tibble(list_of_dfs[2][[1]])

  data <- full_join(df1, df2)

  for (i in 3:length(list_of_dfs)) {
    df_temp  <- as_tibble(list_of_dfs[i][[1]])
    data <- full_join(data, df_temp)
  }

  return(data)
}

ssb_import_n_create_file_by_tabnum <- function(tabnum, filetype = "csv") {
  d <- ssb_giga_pull(tabnum)
  if (filetype == "csv") {
    newname <- stringr::str_c("ssb_", tabnum, ".csv")
    write.csv(d, newname)
  } else if (filetype == "RDS") {
    newname <- stringr::str_c("ssb_", tabnum, ".RDS")
    saveRDS(d, newname)
  }
}
