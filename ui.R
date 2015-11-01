library(phreeqc)
library(shiny)
library(shinyAce)

#' Define UI for application that demonstrates a simple Ace editor
#' @author Justin Jent \email{jentjr@gmail.com}
shinyUI(
  bootstrapPage(div(
    class="container-fluid",
    div(class="row-fluid",
        div(class="span6",
            h3("Select Database"),
            selectInput(inputId = "database", label = "", 
                        c( "phreeqc.dat", "wateq4f.dat", "minteq.dat", 
                           "minteq.v4.dat", "pitzer.dat", "iso.dat", 
                           "llnl.dat", "sit.dat", "Amm.dat", "ex15.dat")),
            h3("Phreeqc Input"),  
            aceEditor("phreeq_input", mode = "r", value = ""),
            actionButton("phreeq_run", "Run phreeqc")
        ),
        div(class="span6",
            h2("Output"),
            verbatimTextOutput("phreeq_output")
        )
    )
  )))