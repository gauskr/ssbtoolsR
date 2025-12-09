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

#' SSB overview
#'
#' @importFrom stringr str_c
#' @importFrom purrr map_chr
#' @param df A dataframe.
#' @return Prints an overview of what's inside a dataset. Variables with 100 or more unique values just return the number of unique values.
#' @export


ssb_overview <- function(df) {
  a <- lapply(df, function(x) length(unique(x)))
  large_unique <- unlist(a) > 99
  dfnames <- names(df[large_unique])
  pull_some_content <- function(x) {
    x <- x[1:10]
    x <- stringr::str_c(x, collapse = ", ")
    x
  }
  some_content <- purrr::map_chr(df[large_unique], pull_some_content)
  length_unique <- a[unlist(a) > 99]
  col_id <- (1:length(names(df)))
  large_colid <- col_id[large_unique]
  to_print <- stringr::str_c("Column: ", large_colid, ", Variable name: ", dfnames, "\nN. unique values = ", length_unique, "\nhead = ", some_content, sep = "")
  cat(to_print, sep="\n\n")
  lapply(df[unlist(a) < 100], unique)
}
