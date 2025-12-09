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

ssb_clean_df <- function(df, include = NULL) {
  if (is.null(include)) {
    message("Select the columns you want to include, and add an include-argument to your function call:\nssb_clean_df(df, include = c(3,5,6)")
    message(names(df))
    ssb_overview(df)
  }
}
