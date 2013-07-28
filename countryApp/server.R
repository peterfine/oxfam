# Server, required by shiny. Adapted from the tutorial at http://www.rstudio.com/shiny/
# Is probably easier to look at ui.R first.

shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    
    # The following is standard r code to filter the data and generate a ggplot. 
    # input data from the ui.R is made available via the inut object.
    dataset = d
    
    dataset = dataset[year(Date) >= input$startYear & year(Date) <= input$endYear]
    marketList = unique(dataset$Market)
    
    if(input$commodity != "ALL") {
      dataset = dataset[Commodity==input$commodity]
    }
    if(input$market != "ALL") {
      dataset = dataset[Market==input$market]
    }
    if(input$country != "ALL") {
      dataset = dataset[Country==input$country]
      marketList = unique(dataset$Market)
    }
    
    # facet corresponds to the variable with which to split the plot into seperate graphs.
    if(input$facet == "commodity") {
      p=qplot(data=dataset, x=Date, y=Value.USD, geom="line", colour=Market, size=I(1)) + 
               facet_wrap(facets=~Commodity.full, scales="free_y") + theme_grey(base_size=16)
    
      } else if(input$facet == "location") {
      p=qplot(data=dataset, x=Date, y=Value.USD, geom="line", colour=Commodity.full, size=I(1)) + 
        facet_wrap(facets=~Market) + theme_grey(base_size=14)
    }  
    print(p)
  })
})