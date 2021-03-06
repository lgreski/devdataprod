#
# server.R -- devdataprod project
#
library(datasets)
data(mtcars)

shinyServer(function(input,output) {

     output$text1 <- renderText({
          ivNames <- names(mtcars[,1:11])
          indepVars <- as.numeric(input$indepVars)
          modelVars <- " "
          if (length(input$indepVars) < 2){
               modelVars <- "Instructions: To generate a scatterplot matrix from the mtcars data set, please select two or more variables from the list of variables on the left by clicking the checkboxes." 
          }
          else {modelVars <- " "}
          modelVars
          
          
     })
          output$plot1 <- renderPlot({
               ivNames <- names(mtcars[,1:11])
               indepVars <- as.numeric(input$indepVars)
               varList <- list()
               if (length(input$indepVars) >= 2){
                    
                    for (i in 1:length(indepVars)){
                         varList[[i]] <- mtcars[,i]
                    }
                    names(varList) <- ivNames[indepVars]
                    pairs(varList,
                         main="Pairwise Plots of mtcars data") 
               }
 
          })
          output$text2 <- renderText({
               if (length(input$indepVars) >= 2) "Summary Statistics"
          })
          output$table1 <- renderTable({
               indepVars <- as.numeric(input$indepVars)
               if(length(input$indepVars) >= 2) summary(mtcars[,indepVars])
          })
})