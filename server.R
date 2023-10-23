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
  
  ############################## Value Box Outputs ##############################
  
  # value box for number of competitions
  output$number_comp <- renderValueBox({
    valueBox(
      value = dim(tournament)[1], subtitle = "Tournaments to Date",
      icon = fa_i("fas fa-hashtag"), color = "blue"
    )
  })
  
  output$most_title <- renderValueBox({
    
    # Calculate the top country
    top_country <- tournament %>%
      group_by(winner) %>%
      summarise(title_count = n()) %>%
      arrange(-title_count) %>%
      slice(1)
    
    country_name <- top_country$winner
    country_titles <- top_country$title_count
    
    valueBox(
      value = paste(country_name, country_titles), subtitle = "Nation with Most Titles",
      icon = fa_i("fas fa-trophy"), color = "yellow"
    )
  })
})
