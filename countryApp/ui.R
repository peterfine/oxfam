# UI, required by shiny. Adapted from the tutorial at http://www.rstudio.com/shiny/
# Configures the page wit ha set of select and slider inputs, which will make their data
# available to server.R, using the inputId as the variable name. Whenever the input
# changes, the main panel is automatically updated by running the function registered
# to main_plot in the server.

shinyUI(pageWithSidebar(
  headerPanel("World Food Prices"),
  sidebarPanel(
    selectInput(inputId = "commodity",
                label = "Commodity:",
                choices = c("ALL", unique(d$Commodity)),
                selected = "Maize"),
  
    selectInput(inputId = "country",
                label = "Country:",
                choices = c("ALL", unique(d$Country)),
                selected = "ALL"),
    
    selectInput(inputId = "market",
                label = "Market:",
                choices = c("ALL", marketList),
                selected = "ALL"),
    
    selectInput(inputId = "facet",
                label = "Split By:",
                choices = c("commodity", "location"),
                selected = "location"),
    
    sliderInput(inputId="startYear",
                label="Start Year",
                min=year(min(d$Date)),
                max=year(max(d$Date)),
                value = year(min(d$Date)),
                step=1),
    
    sliderInput(inputId="endYear",
                label="End Year",
                min=year(min(d$Date)),
                max=year(max(d$Date)),
                value = year(max(d$Date)),
                step=1)
  ),
  mainPanel(
    plotOutput(outputId = "main_plot", height = "700px")
  )
))