# internal environment to store session-level flags
.ssbtoolsR_env <- new.env(parent = emptyenv())

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "Welcome to ssbtoolsR!\n",
    "This package provides tools to simplify workflows with SSB Statbank and microdata.no.\n",
    "If you use this package in publications, please cite:\n",
    "  Gaute Skrove (2025), ssbtoolsR, version 0.0.0.9000\n",
    "Use citation('ssbtoolsR') for full details.\n",
    "Note: Functions may depend on PxWebApiData. Remember to cite it if used."
  )
}
