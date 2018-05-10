library(shiny)

########################################################

shinyServer(function(input, output, session) {
  
  USER <- reactiveValues(Logged = FALSE , session = session$user) 
  
  source("./Login/Login.R",  local = TRUE)
  source("./rfModel/rf.R",  local = TRUE)
  
 
  output$obs <- renderUI({    
    if (USER$Logged == TRUE) {      
      list(
        selectInput(inputId = "gender", label = "Select your gender:",
                    choices = c("Male", "Female"),
                    selected = "Male"),
        numericInput(inputId = "sat", 
                     label = "Enter your SAT score:", 
                     min = 200, max = 800, 
                     step = 10,
                     value = 600),
        
        sliderInput(inputId = "math",
                    label = "Select your Math score:",
                    value = 10,
                    step = 0.5,
                    min = 1,
                    max = 15),
        
        sliderInput(inputId = "percentage", 
                    label = "Select your Percentage score:", 
                    min = 1, max = 100, 
                    step = .5,
                    value = 70),
        
        actionButton('calc', 'Calculate')
      )
    }                 
  })   
  
  df1 <- eventReactive(input$calc, {
      req(input$sat)
      calculateNew(input$gender, input$sat, input$math, input$percentage)
  })
  df2 <- eventReactive(input$calc, {
    return("Based on your results we recommend that you study :")
  })
  
  output$congrats <- renderText({
    if (USER$Logged == TRUE) {
      "Congratulations on completing High School"
    }
  })
  
  output$intro <- renderText({
    if (USER$Logged == TRUE) {
      df2()
      
    }
  })
  
  output$results <- renderText({
    if (USER$Logged == TRUE) {
      df1()
    }
  })
  
})
