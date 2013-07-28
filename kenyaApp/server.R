# Server, required by shiny. Adapted from the tutorial at http://www.rstudio.com/shiny/
# Is probably easier to look at ui.R first.

shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    
    # The following is standard r code to filter the data and generate a ggplot. 
    # input data from the ui.R is made available via the inut object.
    dataset = d
    
    dataset = dataset[year(date) >= input$startYear & year(date) <= input$endYear]
    
    if(input$commodity != "ALL") {
      dataset = dataset[commodity==input$commodity]
    }
    if(input$location != "ALL") {
      dataset = dataset[location==input$location]
    }
    
    # facet corresponds to the variable with which to split the plot into seperate graphs.
    if(input$facet == "commodity") {
      p=qplot(data=dataset, x=date, y=price, geom="line", colour=location, size=I(1)) + 
               facet_wrap(facets=~commodity, scales="free_y") + theme_grey(base_size=16)
    
      } else if(input$facet == "location") {
      p=qplot(data=dataset, x=date, y=price, geom="line", colour=commodity, size=I(1)) + 
        facet_wrap(facets=~location) + theme_grey(base_size=14)
    }  
    print(p)
  })
})