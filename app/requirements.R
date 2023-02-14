#required packages
req_pkg <- c(
  "tidyverse",
  "readxl",
  "data.table",
  "shiny"
)

#install required packages
install.packages(req_pkg)

#clean up environment & memory
rm(req_pkg)
gc()