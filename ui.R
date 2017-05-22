library(shiny)
library(leaflet)
library(backports)

shinyUI(fluidPage(
      titlePanel("Lima's Economic Indicators by District"),
      sidebarLayout(
            sidebarPanel(width = 3, 
                  selectInput("indicator", "Indicator:",
                  c("Gross Income" = "gross_income",
                  "Net Income" = "net_income",
                  "Household People" = "household_people",
                  "Income Recipients" = "income_recipients",
                  "Food Expenditure" = "food_expenditure",
                  "Clothing Expenditure" = "clothing_expenditure",
                  "Health Expenditure" = "health_expenditure",
                  "Transportation Expenditure" = "transportation_expenditure"), 
                  selected = "gross_income"),
            sliderInput("bin", "Size:", min = 1, max = 10, value = 7)
      ),

      mainPanel(width=9, leafletOutput("map", width = "100%", height = 700)
    )
  )
))
