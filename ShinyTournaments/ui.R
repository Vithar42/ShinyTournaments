#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(rhandsontable)
# Define UI for application that draws a histogram
#shinyUI(fluidPage(
#
#    # Application title
#    titlePanel("Old Faithful Geyser Data"),
#
#    # Sidebar with a slider input for number of bins
#    sidebarLayout(
#        sidebarPanel(
#            sliderInput("bins",
#                        "Number of bins:",
#                        min = 1,
#                        max = 50,
#                        value = 30)
#        ),
#
#        # Show a plot of the generated distribution
#        mainPanel(
#            plotOutput("distPlot")
#        )
#    )
#))
#
#

tagList(
  #shinythemes::themeSelector(),
  navbarPage(theme = shinytheme("yeti"),
             "Shiny Tournaments",
             tabPanel("Paramaters", 
                      wellPanel(h2("Enter some Paramaters that will be used to build the pools and brackets."),
                                sliderInput("n_teams", "Number of Teams:", 2, 16, 16),
                                sliderInput("n_pools", "Number of Pools:", 1, 4, 4),
                                radioButtons("tourny_type", "Tournament Type",
                                             choices = c("Pool Play", "Round Robin"), inline = TRUE),
                                numericInput("max_dif", "Maximum Goal Differential:", 8, min = 1, max = 25),
                                h3("Assumed Ruels")),
                      wellPanel(markdown("
                                # Pool Play
                                There is NO OVERTIME in pool play format.  FOrmat is based on points and ties will be allowed.
                                
                                ## Pool Play Points are as Follows
                            
                                * 2 points for a win
                                * 1 point for a tie
                                * 1 additional point for a shutout win (if score is 0-0, neither team will receive a shutout point)
                                * 0 points for a loss
                            
                                ## Tie Breakers for Pool Play
                            
                                * Head to Head
                                * In case of a 3-way tie, any team that has defeated the other 2 shall earn higher rank
                                * Least number of goals allowed
                                * Lowest total penalty minutes (game misconduct is recorded as a 10 minute penalty)
                                * Coin toss
                                ")
                                )
                      ),
             tabPanel("Tournament",
                      sidebarPanel(
                        "Enter list of team names, order does not matter.",
                        rHandsontableOutput("table_tl"), 
                        actionButton("RandTeam", "Randomize Team Order"),
                        width = 3
                        ),
                      mainPanel(
                        tabsetPanel(
                          tabPanel("Pools",
                                   #TODO Make random pools from the list of teams enterd.
                                   h4("TODO: Make random pools from the list of teams entered."),
                                   tableOutput('pools'),
                                   #TODO Make schedule table from the pools generated in the previous TODO
                                   h4("TODO: Make schedule table from the pools generated in the previous TODO"),
                                   #TODO Make scores editable and interactive from the schedule.
                                   h4("TODO: Make scores editable and interactive from the schedule.")
                                   ),
                          tabPanel("Bracket",
                                   #TODO Make Bracket from restuls from Pool Tab
                                   h4("TODO: Make Bracket from restuls from Pool Tab"),
                                   #TODO Make schdule based on the bracket, scores should be editable.
                                   h4("TODO: Make schdule based on the bracket, scores should be editable.")
                                   )
                          )
                        )
                      )
             )
  )