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


#' SSB metatibby
#'
#' @importFrom stringr str_c
#' @importFrom PxWebApiData ApiData
#' @importFrom tibble tibble
#' @param tablenr A number (written as character string) referring to a SSB-table in SSBs statbank.
#' @return A dataframe (tibble) sized 2 x k, with column 1 giving variable names, and column 2 giving a list column of additional metadata.
#' @export


ssb_metatibby <- function(tablenr) {
  url <- str_c("https://data.ssb.no/api/v0/en/table/", tablenr, "/", collapse = "")
  metalist <- ApiData(url, returnMetaFrames = TRUE)
  metatibby <- tibble(names = vector("character", length(metalist)),
                      values = vector("list", length(metalist)))

  for (i in seq_along(metalist)) {
    metatibby[[i, 1]] <- names(metalist)[i]
    metatibby[[i, 2]] <- list(metalist[[i]][[1]])
  }
  return(metatibby)
}
