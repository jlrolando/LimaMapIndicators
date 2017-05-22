library(shiny)
library(leaflet)
library(backports)

shinyUI(fluidPage(

  # Application title
  titlePanel("Lima's Economic Indicators by District"),

  # Sidebar with a slider input for number of bins
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

    # Show a plot of the generated distribution
    mainPanel(width=9, 
        leafletOutput("map", width = "100%", height = 700)
    )
  )
))
