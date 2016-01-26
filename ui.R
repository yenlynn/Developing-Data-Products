library(shiny)
data(iris)
shinyUI(navbarPage("Iris Application",
             tabPanel("Histogram",
               sidebarPanel(
                 selectInput("type","Select the variable from iris dataset",choices=c( "Petal.Width","Petal.Length", "Sepal.Length" , "Sepal.Width"), selected ="Petal.Length"),
                 radioButtons("color", "Select the colour of the graph:", choices = c("Red", "Blue", "Purple","Yellow", "Green"), selected = "Red"),
                 sliderInput("breaks", "Select the breakpoints between the histogram cells", min= 5, max=25, value =15, step=10)
                 ),
        
        mainPanel(
           plotOutput("hist")
           )
    ),

   tabPanel("Data",
           sidebarPanel(
              checkboxGroupInput("species", 
                                 "Select the species from the Iris dataset", 
                                  choices = c("setosa", 
                                              "virginica", 
                                              "versicolor"),
                                  selected = "setosa")),
           dataTableOutput("Selected")
   ),
   

  tabPanel("Summary",
            "This is the summary of the Iris dataset:",
             verbatimTextOutput("summary")
   ),

  tabPanel("Documentation",
         p("The application is build using the Edgar Anderson's Iris Data."),
         p( "There are 4 tabs in this application which include Histogram, Data, Summary and Documentation."),
         p( "1.The first Histogram tab allows user to choose variables from the Iris dataset
            to plot a histogram. User can also change the colour of their choice for the histogram from radio buttons.
            "),
         p("2.The second Data tab allows user to view the data by selecting the different species in iris data.
            User are able to search words by typing into the search textbox."),
         p("3.The third Summary tab allows user to view the summary of the Iris dataset."))
         
))

