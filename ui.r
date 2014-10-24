library(shiny)
input <- read.table("DemandInput.csv",header=T,sep=";")
fin <- as.vector(unique(input$OD,incomparables=F))
shinyUI(pageWithSidebar(
  headerPanel("Demand Forecasting: US Top 100 Markets"),
  sidebarPanel(
    h4('Forecast Inputs'),
    selectInput("Market", label = h6("Select Round Trip Market"), 
              choices = fin, selected = 1),
    selectInput("Method",label = h6("Select Forecasting Method"),  
                choices = list("Exponential Smoothing" = 1, "ARIMA" = 2
                              ), selected = 1),
    selectInput("Period",label = h6("Select Forecasting Periods"),  
              choices = list("1" = 1, "2" = 2,"3" = 3,"4" = 4,"5" = 5,"6" = 6,
                           "7" = 7,"8" = 8,"9" = 9,"10" = 10,"11" = 11,"12" = 12
          ), selected = 6)
    
   ## actionButton("goButton", "Go!")
    
  ),
  mainPanel(
    tabsetPanel(type="tab",
                  tabPanel("Historical Series",plotOutput("plot1")),
                  tabPanel("Seasonal Plot",plotOutput("plot2")),
                  tabPanel("Forecast Predictions",plotOutput("plot3")),
                  tabPanel("Data",dataTableOutput("table")),
                  tabPanel("App Documentation",p("Documentation:",a("Top US Markets",href="AppDocumentation.html")))
                           )    
                           
                           
                           )
                  )
               
    
    
    
  )
