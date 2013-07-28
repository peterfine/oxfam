# UI, required by shiny. Adapted from the tutorial at http://www.rstudio.com/shiny/
# Configures the page wit ha set of select and slider inputs, which will make their data
# available to server.R, using the inputId as the variable name. Whenever the input
# changes, the main panel is automatically updated by running the function registered
# to main_plot in the server.

shinyUI(pageWithSidebar(
  headerPanel("Kenya Food Prices"),
  sidebarPanel(
    selectInput(inputId = "commodity",
                label = "Commodity:",
                choices = c("ALL", unique(d$commodity)),
                selected = "ALL"),
    
    selectInput(inputId = "location",
                label = "Location:",
                choices = c("ALL", unique(d$location)),
                selected = "ALL"),
    
    selectInput(inputId = "facet",
                label = "Split By:",
                choices = c("commodity", "location"),
                selected = "location"),
    
    sliderInput(inputId="startYear",
                label="Start Year",
                min=year(min(d$date)),
                max=year(max(d$date)),
                value = year(min(d$date)),
                step=1),
    
    sliderInput(inputId="endYear",
                label="End Year",
                min=year(min(d$date)),
                max=year(max(d$date)),
                value = year(max(d$date)),
                step=1)
  ),
  mainPanel(
    plotOutput(outputId = "main_plot", height = "700px")
  )
))