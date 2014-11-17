library(shiny) 

vars <- list("Year" = "year", 
             "Age" = "age", 
             "Marital Status" = "maritl",
             "Race" = "race",
             "Education" = "education",
             "Job Class" = "jobclass",
             "Health" = "health",
             "Health Insurance" = "health_ins" 
)

shinyUI( 
    pageWithSidebar(

      headerPanel("Mid-Atlantic Wage Analysis"),
  
      sidebarPanel(
        selectInput("xvar", " X Variable:", vars),
        selectInput("colvar", " Colour Variable:", vars),
        checkboxInput("regression", "Show Regression Lines", FALSE),
        checkboxInput("meandot", "Show mean", FALSE)
      ), 
      
      mainPanel(
        h3(textOutput("caption")),
        plotOutput("wagePlot")
        ) 
    )
)
