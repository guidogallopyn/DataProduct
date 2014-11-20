# Shiny application for Coursera Data Specialization Data products Course
# Guido Gallopyn
#

library(shiny) 
library(ggplot2)
library(ISLR); data(Wage)

# function used to calculate summary of od specified type
f <- function(x,type) switch(type, "mean" = mean(x),"sd" = sd(x), "min" = min(x),"max" = max(x), 
                             "median"= median(x), "Q1" = quantile(x,0.25),"Q3" = quantile(x,0.75))

shinyServer( 
  function(input, output) {
    
    # Reactive expressions to generate the requested data. 
    data <- reactive({  
     data.frame(wage=Wage$wage, xvar=Wage[[input$xvar]], colvar=Wage[[input$colvar]])
    })
    
    df <- reactive({
      if(input$xvar==input$colvar) {
        aggregate(Wage$wage,by=list(xvar=Wage[[input$xvar]]), function(x) f(x,input$func))
      }
      else {
        d <-aggregate(Wage$wage,by=list(xvar=Wage[[input$xvar]],colvar=Wage[[input$colvar]]),
                      function(x) f(x,input$func))
        d <- reshape(d,direction="wide",idvar="xvar",timevar="colvar")
        names(d) <- c(input$xvar,levels(as.factor(Wage[[input$colvar]])))
        print(d)
      }
    })
    
    # Compute variable text in a reactive expression  
    varText <- reactive({if(input$xvar==input$colvar) input$xvar 
                         else paste(input$xvar, "and", input$colvar)})
    
    # Return the formula text for printing as a caption
    output$plotHeader <- renderText({paste("Plot wage per", varText())})

    # Return the header for the summary tab
    output$summaryHeader <- renderText({paste(input$func,"wage per", varText())})
 
    # Return the header text for the table tab
    output$tableHeader <- renderText({paste("Number of observations per", varText())})
    
    # Generate a plot of the requested variable against mpg and only 
    # include outliers if requested
      output$wagePlot <- renderPlot({       
        p <- ggplot(data(), aes(xvar,wage,colour=colvar)) + 
        guides(colour=guide_legend(input$colvar)) +
        ylab("Annual Wage (1000s USD)") + xlab(input$xvar)
        if(input$xvar=="age") p<- p + geom_point()
        else p <- p + geom_jitter()
        if(input$regression==TRUE) p <- p + geom_smooth(method='loess', formula=y~x)
        print(p)
    })
    
    # Generate a summary table of the data
    output$summary <- renderTable({ df() }, digits=1, include.rownames=FALSE)
    
    # Generate an HTML table view of the data
    output$table <- renderTable({
      with(data(), if(input$xvar==input$colvar) table(xvar) else table(xvar, colvar))})
  }
)

