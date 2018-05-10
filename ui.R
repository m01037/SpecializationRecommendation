shinyUI(
  fluidPage(
    
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    ),
    
    headerPanel("Specialization Recommendation Engine"),
    
    br(),
    br(),
    br(),
    br(),
    
    div(class = "login",
        uiOutput("uiLogin"),
        style = "text-align: left; position:absolute; top: 40%; left: 50%; margin-top: -100px; margin-left: -150px;",
        textOutput("pass"),
        tags$head(tags$style("#pass{color: red;"))
    ),    
    
    fluidRow(
      column(5,
             div(class = "span1",      
                 uiOutput("obs")
             )
      ),
      column(6,
             div(class = "logininfo",
                 uiOutput("userPanel"),
                 style = "text-align: right; position:relative; top: 5%; left: 60%;"
             ),
             hr(),
             div(class = "congrats",      
                 uiOutput("congrats"),
                 style = "color: green; font-size: 20px; font-style: bold;"
                 ),
             
             br(),
             br(),
             
             div(class = "intro",      
                 uiOutput("intro"),
                 style = "color: black; font-size: 15px; font-style: bold;"
             ),
             
             div(class = "results",      
                 uiOutput("results"),
                 style = "color: red; font-size: 15px; font-style: bold;"
             )
      )
    )
    
    
  )
)
