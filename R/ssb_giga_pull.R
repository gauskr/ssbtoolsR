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

#' SSB Giga pull
#'
#' @param tabnr A number (written as character string) referring to a SSB-table in SSBs statbank.
#' @param size An integer which controls the number of Regions to be imported at once.
#' @param sys_sleep An integer which controls how long the computer 'sleeps' before importing the next chunk of data.
#' @return A data frame (tibble) containing the pulled data.
#' @export

ssb_giga_pull <- function(tabnr, size = 10, sys_sleep = 2) {
  d <- ssb_giga_pull_internal(tabnr = tabnr, size = size, sys_sleep = sys_sleep)
  return(d)
}
