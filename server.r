library(shiny)
library(forecast)
library(ggplot2)
inp <- read.table("DemandInput.csv",header=T,sep=";")
inp$YYMM <- as.Date(paste(inp$YY,inp$MM,"1",sep="-"))
shinyServer(
  function(input, output) {
    dat <- reactive({subset(inp, inp$OD==input$Market)})
    dat1 <- reactive({subset(dat(),YY>2011)})
        ##p <- reactive({ggplot(dat(), aes(x = YY, y = PAX)) + geom_line(size = I(1.2),color="red")})
    myts <- reactive({ts(dat()$PAX, start=c(2008, 1), end=c(2014, 7), frequency=12)}) 
    reactive({par(bg="beige")})
    p <- reactive({plot(myts(),col="darkred",main="Historical Time Series",frame=F,ylab="Passengers",xlab="Year",tck=0,lwd=2.5)})
    t <- reactive({ggplot(dat1())+ geom_point(aes(x=strftime(YYMM,format="%m"),y=PAX, color=strftime(YYMM,format="%Y")), size=3)+scale_color_discrete(name="Year")+labs(x="Month")+geom_line(aes(x=strftime(YYMM,format="%m"),y=PAX,group=YY,color=factor(YY)),size=1.3) + ggtitle("Seasonal Pattern")})
    
    
    z <- reactive({seasonplot(myts(),main="Seasonal Plot")})
    fit1 <- reactive({ 
             auto.arima(myts())} )
    fit2 <- reactive({
             ets(myts())})
    fit <- reactive({if (input$Method=="2") {fit1()} else {fit2()}})
    h <- reactive({as.numeric(input$Period)})
    
    pred <- reactive({forecast(fit(),h())})
    out <- reactive({as.numeric(as.matrix(pred()$mean))})
    met <- reactive({if (input$Method=="1") {"Exponential Smoothing"} else {"ARIMA"}})
    title <- reactive({paste("Predictions using",met(),sep=" ")})
    s <- reactive({plot.forecast(pred(),col="darkred",main=title(),xlab="Year",ylab="Passengers",lwd=2.5,frame=F,tck=0)})
    output$table <- renderDataTable({dat()[,1:4]})
    output$plot1 <- renderPlot({ 
      p()
    })
    
    output$plot2 <- renderPlot({ 
      t()
    })
    
    output$plot3 <- renderPlot({ 
      s()
    })
      
    
  }
)