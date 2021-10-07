library(shiny)
library(shinythemes)
library(shinyWidgets)
library(shinydashboard)
library(dipsaus)
library(misc)

source("misc.R")
source("tab_proportion_test.R")


# UI 
ui <- fluidPage(
    theme = shinytheme('spacelab'),
    includeCSS("custom.css"),
    #useShinydashboard(),
    navbarPage("Sample Size Calculator",
        tab_proportion_test
    )
)


# Server
server <- function(input, output) {
  
  sample_size = eventReactive(input$calculate, {
    calculate_sample_size(
      baseline = input$baseline/100,
      improvement = input$improvement/100,
      significance = input$significance/100,
      wanted_power = input$wanted_power/100,
      improvement_type = input$improvement_type
    )
    
  })
  
  output$sample_size = renderText({
    res = sample_size()
    if(sample_size() == 9999999) {
      "More than 10M users needed. Exact number not calculated."
    } else {
      format(res, big.mark = ',')
    }
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
