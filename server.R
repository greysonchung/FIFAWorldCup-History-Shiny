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
  
  # value box for nation with most titles
  output$most_title <- renderValueBox({
    
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
  
  output$most_win <- renderValueBox({
    
    team_wins <- matches %>%
      filter(winner != "draw") %>%
      group_by(winner) %>%
      summarise(count = n()) %>%
      arrange(-count)
    
    # Extract the team with the most wins
    top_team <- team_wins$winner[1]
    top_team_wins <- team_wins$count[1]
    
    valueBox(
      value = paste(top_team, top_team_wins), subtitle = "Nation with Most Games Won",
      icon = fa_i("fas fa-people-group"), color = "aqua"
    )
  })
  
  output$most_goal <- renderValueBox({
    
    team_goals <- goals %>%
      group_by(team_name) %>%
      summarise(count = n()) %>%
      arrange(-count)
    
    top_team <- team_goals$team_name[1]
    top_team_goals <- team_goals$count[1]
    
    valueBox(
      value = paste(top_team, top_team_goals), subtitle = "Nation with Most Goals",
      icon = fa_i("fas fa-futbol"), color = "red"
    )
  })
})
