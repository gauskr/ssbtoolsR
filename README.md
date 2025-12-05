# ssbtoolsR <img src="https://raw.githubusercontent.com/rstudio/hex-stickers/master/PNG/RStudio.png" align="right" width="100"/>

<!-- Badges -->
![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
![License: AGPL-3](https://img.shields.io/badge/license-AGPL--3-blue.svg)
![R](https://img.shields.io/badge/R-%3E%3D%204.0-blue)
![Status](https://img.shields.io/badge/status-WIP-yellow)

---

## 🚀 Overview

**ssbtoolsR** is an R package designed to simplify and speed up common workflows when working with:

- **Statistics Norway (SSB) Statbank API / PxWeb**
- **microdata.no** (secure research environment)

These functions began as a personal toolbox developed during my Ph.D. work to make large-scale SSB data handling faster, cleaner, and more reproducible.  
Now they are collected into a single (experimental) package to share with others who work with the same data sources.

> ⚠️ This package is under **active development**.  
> Interfaces, function names, and behaviour may change.  
> Feedback is highly welcome!

---

## 🙌 Contribute, Discuss, Improve

You are warmly invited to:

- report bugs  
- propose improvements  
- contribute code  
- request new features  
- discuss best practices  

👉 Open an Issue here:  
https://github.com/gauskr/ssbtoolsR/issues

Or send an email: **gauskr@proton.me**

---

## 🔒 License

This project is licensed under the **AGPL-3** license.

This means:

- You are free to use, study, modify, and redistribute the package  
- Any modifications or derivative works must remain under AGPL-3  
- The original author must be credited  

See `LICENSE.md` for full details.

---

## 🧰 Requirements

To use or develop this package effectively:

- **RStudio** is recommended (or another IDE that supports project-based workflows)
- Basic familiarity with R projects and R package structure is helpful
- Internet access is required for Statbank API functions
- Access to **microdata.no** environment is required for microdata-specific tools

---

## 📦 Installation

### 🔧 Install the development version from GitHub

```r
# install.packages("devtools")
devtools::install_github("gauskr/ssbtoolsR")
