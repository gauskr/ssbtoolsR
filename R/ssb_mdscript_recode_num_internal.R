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

#' @importFrom stringr str_c

ssb_mdscript_recode_num_internal <- function(df, varname, cols = c(1,2)) {
df <- df[cols]
codebody <- stringr::str_c("(", df[[1]], " = ", df[[2]], ")", collapse = " ")
stringr::str_c("recode ", varname, " ", codebody)
}
