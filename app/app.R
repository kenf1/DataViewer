#load libraries
library(tidyverse)
library(readxl)
library(data.table)
library(shiny)
library(DT)

#load backend
source("functions.R")

#start app
shinyApp(ui=ui,server=server)
