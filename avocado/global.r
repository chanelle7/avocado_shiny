library(shiny)
library(dplyr)
library(ggplot2)
library(tidyr)
library(shinydashboard)
library(DT)

df = read.csv('city_avocado.csv', stringsAsFactors = FALSE)
df$Date = as.Date(df$Date)