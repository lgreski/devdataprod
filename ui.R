#
# ui.R -- devdataprod project
#
shinyUI(pageWithSidebar(
     headerPanel("mtcars Scatterplot Matrix"),
     sidebarPanel(
          checkboxGroupInput("indepVars",
                             label= h3("Variable List"),
                             choices= list("mpg" = 1,
                                           "cyl" = 2,
                                           "disp" = 3,
                                           "hp" = 4,
                                           "drat" = 5,
                                           "wt" = 6,
                                           "qsec" = 7,
                                           "vs" = 8,
                                           "am" = 9,
                                           "gear" = 10,
                                           "carb" = 11)
                             # ,selected=c(1,2)
          )
     ),
mainPanel(

     textOutput("text1"),
     br(),
     br(),
     plotOutput("plot1"),
     br(),
     tags$h2(textOutput("text2")),
     br(),
     tableOutput("table1")
)     
))