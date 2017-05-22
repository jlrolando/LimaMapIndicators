library(shiny)
library(dplyr)
library(leaflet)
library(backports)

Lima.plot<-read.csv("Lima_plot.csv")

shinyServer(function(input, output) {

      output$map <- renderLeaflet({
            Lima.plot %>% leaflet() %>% addTiles() %>%
                  setView(lng = median(Lima.plot$longitude), 
                          lat = median(Lima.plot$latitude), zoom = 11)
      })
      
      observe({
            
            indicatorBy<-input$indicator
            radius = Lima.plot[[indicatorBy]] / max(Lima.plot[[indicatorBy]])
            
            pal <- colorFactor("Greens", radius)
            
            if(indicatorBy == "household_people" | indicatorBy == "income_recipients") {
                  leafletProxy("map", data = Lima.plot) %>%
                  clearShapes() %>%
                  addCircles(weight =2, radius = radius*500*input$bin,
                        lng = Lima.plot$longitude, lat = Lima.plot$latitude, 
                        fillColor = pal(radius), popup = paste(Lima.plot$district, "<br>",
                        formatC(Lima.plot[[indicatorBy]], digits=1, 
                        format="f", big.mark = ",",
                        decimal.mark = "."))) 
            } else {
                  leafletProxy("map", data = Lima.plot) %>%
                        clearShapes() %>%
                        addCircles(weight =2, radius = radius*500*input$bin,
                              lng = Lima.plot$longitude, lat = Lima.plot$latitude, 
                              popup= paste(Lima.plot$district, "<br>", "S/.",
                              formatC(Lima.plot[[indicatorBy]], digits=0, 
                              format="f", big.mark = ",",
                              decimal.mark = ".")))
            }
            
            }) 
          
})
