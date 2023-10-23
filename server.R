#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.

# Importing libraries
library(shiny)
library(stringr)
library(shinythemes)
library(fontawesome)
library(shinydashboard)
library(igraph)
library(highcharter)
library(dplyr)
library(tidyr)
library(dashboardthemes)
source('helper.R')

# Set a global theme highcharter plot
options(highcharter.theme = hc_theme_hcrt())

server <- shinyServer(function(input, output) {
  
})
