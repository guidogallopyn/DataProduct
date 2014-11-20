# Shiny application for Coursera Data Specialization Data products Course
# Guido Gallopyn
#

library(shiny) 
require(markdown)

vars <- list("Age" = "age", 
             "Year" = "year", 
             "Marital Status" = "maritl",
             "Race" = "race",
             "Education" = "education",
             "Job Class" = "jobclass",
             "Health" = "health",
             "Health Insurance" = "health_ins")

shinyUI( 
    pageWithSidebar(

      headerPanel("Mid-Atlantic Wage Explorer"),
  
      sidebarPanel(
        selectInput("xvar", "Chose X Variable:", vars, selected="age"),
        selectInput("colvar", "Chose Colour Variable:", vars, selected="year"),
        conditionalPanel(condition = "input.tabid == 'Plot'",
          checkboxInput("regression", "Show Regression Lines", FALSE)
          ),
        conditionalPanel(condition = "input.tabid == 'Summary'",
          radioButtons("func", "Summary function:",
                                c("Mean" = "mean",
                                  "Standard Deviation" = "sd",
                                  "Minimum" = "min",
                                  "25% Quantile" = "Q1",
                                  "Median" = "median",
                                  "75% Quantile" = "Q3",
                                  "Maximum" = "max"
                                  ))
        )
      ), 
      
      mainPanel(
        tabsetPanel(id="tabid",
          tabPanel("Plot", 
                   h3(textOutput("plotHeader")),
                   plotOutput("wagePlot")
                   ), 
          tabPanel("Summary", 
                   h3(textOutput("summaryHeader")),
                   tableOutput("summary")
                   ), 
          tabPanel("Table", 
                   h3(textOutput("tableHeader")),
                   tableOutput("table")
                   ),
          tabPanel("About", 
                   includeMarkdown("about.md")
                   )
        ) 
    )
))
