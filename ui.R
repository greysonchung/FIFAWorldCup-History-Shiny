#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.

# Importing libraries
library(shiny)
library(shinythemes)
library(fontawesome)
library(shinyWidgets)
library(shinydashboard)
library(igraph)
library(highcharter)
library(dashboardthemes)
source('helper.R')

header <- dashboardHeader(
  # Define the header and insert image as title
  title = tags$a(tags$img(src='https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/FIFA_logo_without_slogan.svg/1280px-FIFA_logo_without_slogan.svg.png',
                          height='40', width='130')),
  titleWidth = 280
)

sidebar <- dashboardSidebar(
  width = 280,
  sidebarMenu(
    # Tab for different visualisation
    menuItem("Home",
             tabName = "home",
             selected = T,
             icon = fa_i('fas fa-futbol')),
    menuItem("World Cup Timeline",
             tabName = "timeline",
             icon = fa_i("fas fa-trophy")),
    menuItem("Team Statistics",
             tabName = "shooter",
             icon = fa_i("fas fa-people-group")),
    menuItem("Player Statistics",
             tabName = "school",
             icon = fa_i("fas fa-shirt")),
    menuItem("Social Media",
             icon = fa_i("fas fa-share-square"),
             menuSubItem(a(icon("linkedin"), " Linkedin", href="https://www.linkedin.com/in/greychung/", target="_blank")))
  )
)

body <- dashboardBody(
  customTheme,
  tabItems(
    # Structure for home tab
    tabItem("home",
            fluidPage(
              titlePanel(strong('Overview of FIFA World Cup History')),
              hr(),
              h5(strong("The Story So Far..."), style = "font-size:16px;"),
              # Value box
              fluidRow(
                column(3, valueBoxOutput("number_comp", width = 14)),
                column(3, valueBoxOutput("most_title", width = 14)),
                column(3, valueBoxOutput("most_win", width = 14)),
                column(3, valueBoxOutput("most_goal", width = 14))
              )
            )
    )
  )
)

# Putting the UI together
ui <- dashboardPage(
  title = "World Cup Dashboard",
  header, 
  sidebar, 
  body
)
