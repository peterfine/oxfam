library(shiny); library(ggplot2); library(data.table)

d=data.table(read.csv("ken.data.csv", as.is=TRUE))
d[, date := as.Date(date)]

# This loads the server.R and ui.R files in the webapp 
# folder, runs the server and launches the browser.
runApp("kenyaApp/")

