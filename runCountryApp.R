library(shiny); library(ggplot2); library(data.table)

d=data.table(read.csv("country-food.csv", as.is=TRUE))
d[, Date := as.Date(Date, format="%d-%b-%y")]
d[is.na(Value.USD)]

d[ ,Market := paste0(Country, ": ", Market)]
marketList = unique(d$Market)

# This loads the server.R and ui.R files in the webapp 
# folder, runs the server and launches the browser.
runApp("countryApp/")