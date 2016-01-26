library(shiny)
data(iris)
shinyServer( 
  
  function(input, output) {
    
    irisPlot <- reactive({
      hist(iris[,input$type], col=input$color, 
           main = "Histogram of Iris dataset",
           xlab = colnames(iris[input$type]),
           breaks =input$breaks)
    })
    
    irisTable <- reactive({
      iris[iris$Species %in% c(input$species),]
 
    })  
    
    output$hist <- renderPlot({
      irisPlot()
    })
   
    output$Selected <- renderDataTable({
      irisTable()
    })
   
    output$summary <- renderPrint({
      summary(iris)
    })
    
})