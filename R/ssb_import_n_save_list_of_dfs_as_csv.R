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
#' @param tabnum_list A vector of type character, with numbers corresponding to SSB/statbank-tables. written as character string, referring to a SSB-table in SSBs statbank.
#' @param file A path to, and name of, txt-file containing table numbers (one per row) for SSB/statbank - tables.
#' @return Several files (csv) with data from tables corresponding to tabnum_list.
#' @export

ssb_import_n_save_list_of_dfs_as_csv <- function(tabnum_list = NULL, file = NULL) {
  ssb_import_n_save_list_of_dfs_as_csv_internal(tabnum_list = tabnum_list, file = file)
}
