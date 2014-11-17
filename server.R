library(shiny) 
library(ggplot2)
library(ISLR); data(Wage)

# UI variables
# xvar
# colvar
# outliers
# caption
# wagePlot

shinyServer( 
  function(input, output) {
    
    # Compute the forumla text in a reactive expression  
    formulaText <- reactive({
      paste("wage ~", input$xvar)
    })

    # Return the formula text for printing as a caption
    output$caption <- renderText({paste("Plot",formulaText())})
    
    # Generate a plot of the requested variable against mpg and only 
    # include outliers if requested
      output$wagePlot <- renderPlot({
        df <- data.frame(wage=Wage$wage, xvar=Wage[[input$xvar]], colvar=Wage[[input$colvar]])
        p <- ggplot(df, aes(xvar,wage,colour=colvar)) + 
        guides(colour=guide_legend(input$colvar)) +
        ylab("Annual Wage (1000s USD)") + 
        xlab(input$xvar)
        if(input$xvar=="age") p<- p + geom_point()
        else p <- p + geom_jitter()
        if(input$regression==TRUE) p <- p + geom_smooth(method='lm', formula=y~x)
        p
    })
  }
)

