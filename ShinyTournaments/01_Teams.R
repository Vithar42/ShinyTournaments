
vals <- reactiveValues()
#vals$teamlist <- 

observe(
  vals$teamlist <- tibble(TeamName = seq(1, input$n_teams, 1)) %>%
    mutate(TeamName = "")
)

observeEvent(input$RandTeam, {
  vals$teamlist$TeamName <- sample(vals$teamlist$TeamName)
  # print(vals$teamlist)
  # browser()
})

observe({
  if(!is.null(input$table_tl))
    vals$teamlist <- hot_to_r(input$table_tl)
})


output$table_tl <- renderRHandsontable({
  rhandsontable(vals$teamlist, width = 300) %>%
    hot_cols(colWidths = 200)
})


#output$result <- renderText({ 
#  sum(vals$teamlist)
#})














#observe(
#  vals$teamlist <- tibble(TeamName = seq(1, input$n_teams, 1)) %>%
#    mutate(TeamName = "")
#)
#
## Randomize team order when button is clicked
#observeEvent(input$RandTeam, {
#  
#  vals$teamlist <- sample(vals$teamlist)
#  
#  print("ran")
#  #tl <- hot_to_r(input$TeamList)
#  #tl <- sample(tl)
#  
#})
#
## pannel inpute for teams
#output$TeamList <- renderRHandsontable({
#  
#
#  
#  rhandsontable(vals$teamlist, width = 300) %>%
#    hot_cols(colWidths = 200)
#  
#})
