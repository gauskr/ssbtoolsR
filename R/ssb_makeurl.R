# Copyright (C) 2025 Gaute Skrove
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

#' SSB makeurl
#'
#' @importFrom stringr str_c
#' @param tablenr A number (written as character string) referring to a SSB-table in SSBs statbank.
#' @return A char vector of length one with the corresponding webadress (api) of the table.
#' @export

ssb_makeurl <- function(tablenr) {
  str_c("https://data.ssb.no/api/v0/en/table/", tablenr, "/", collapse = "")
}
