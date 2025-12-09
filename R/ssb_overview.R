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
#' @param df A dataframe.
#' @return Prints an overview of what's inside a dataset. Variables with 100 or more unique values just return the number of unique values.
#' @export


ssb_overview <- function(df) {
  a <- lapply(df, function(x) length(unique(x)))
  print(a[unlist(a) > 99])
  lapply(df[unlist(a) < 100], unique)
}
