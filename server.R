library(phreeqc)
library(shiny)
library(shinyAce)

#' Define server logic required to generate simple ace editor
#' @author Justin Jent \email{jentjr@gmail.com}
shinyServer(function(input, output, session) {
  
  load_database <- reactive({
    temp <- tempfile()
    writeLines(input$phreeq_database, temp)
    phrLoadDatabase(temp)
  })
  
  output$phreeq_output <- renderPrint({
    input$phreeq_run
    load_database()
    isolate(phrSetOutputStringsOn(TRUE))
    isolate(phrRunString(input$phreeq_input))
    return(isolate(cat(phrGetOutputStrings(), sep = "\n")))
  })  
})