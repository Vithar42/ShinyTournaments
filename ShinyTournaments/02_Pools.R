
teamlist <- reactive({
  #hot_to_r(input$TeamList)
  vals$teamlist
})


output$pools <- renderTable({
  df_pools <- teamlist()
  
  #browser()
    
  df_pools %>%
    add_column(Pool = "",
               G1 = "", 
               G2 = "", 
               G3 = "", 
               Pts = "", 
               Diff = "", 
               GA = "", 
               Seed = "") %>%
    group_modify(~pool_maker(., n_teams / input$n_pools))
  
})