# Copyright (C) 2025 Gaute Skrove gauskr@proton.me
# This file is part of the ssbtoolsR package.
# ssbtoolsR is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# ssbtoolsR is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
# See LICENSE.md in the package root for full license text.


#' @importFrom dplyr mutate summarise group_by full_join select
#' @importFrom purrr map_int
#' @importFrom stringr str_c str_remove
#' @importFrom tibble tibble as_tibble
#' @importFrom rlang parse_expr
#' @importFrom PxWebApiData ApiData12

ssb_giga_pull_internal <- function(tabnr, size = 10, sys_sleep = 2) {

  pr_import <- size
  url <- ssb_makeurl(tabnr)
  tibtable <- ssb_metatibby(tabnr)
  varnum <- dim(tibtable)[1]
  body1 <- 1:varnum
  varlengths <- purrr::map_int(tibtable$values, length)
  splitvar <- (1:length(varlengths))[varlengths == max(varlengths)]
  num_unique_splitvar <- max(varlengths)

  body2 <- stringr::str_c("{{tibtable[[1]][", body1, "] = tibtable[[", body1, ",2]][[1]]}}")

  to_be_splitted <- 1:num_unique_splitvar

  iteration_nrs <- tibble::tibble(split_vec = to_be_splitted) |>
           dplyr::mutate(by_import = split_vec %% pr_import,
           is_start = by_import == 1,
           iteration_nr = cumsum(is_start)) |>
    dplyr::group_by(iteration_nr) |>
    dplyr::summarise(min = min(split_vec),
              max = max(split_vec)) |>
    dplyr::mutate(code = stringr::str_c(min, ":", max)) |>
    dplyr::select(code) |> unlist()

  iterations <- length(iteration_nrs)

  separate_code <- vector("character", length = iterations)

  for (i in 1:iterations) {
    body_clone <- body2
    body_clone[splitvar] <- stringr::str_c(stringr::str_remove(body2[splitvar], "\\}\\}"), "[", iteration_nrs[i], "]}}")
    code_chunk <- stringr::str_c(body_clone, collapse = ",\n")
    separate_code[i] <- stringr::str_c("PxWebApiData::ApiData12(url,\n", code_chunk, ")")
  }

  list_of_dfs <- vector("list", length = iterations)

  for (i in 1:length(separate_code)) {
    data <- eval(rlang::parse_expr(separate_code[i]))
    list_of_dfs[i] <- list(data)
    Sys.sleep(sys_sleep)
  }

  df1 <- tibble::as_tibble(list_of_dfs[1][[1]])
  df2 <- tibble::as_tibble(list_of_dfs[2][[1]])

  data <- dplyr::full_join(df1, df2)

  for (i in 3:length(list_of_dfs)) {
    df_temp  <- tibble::as_tibble(list_of_dfs[i][[1]])
    data <- dplyr::full_join(data, df_temp)
  }

  return(data)
}
