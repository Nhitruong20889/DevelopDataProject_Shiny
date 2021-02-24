library(shiny)
library(datasets)
library(ggplot2)
library(plotly)

prdt <- diamonds
prdt$cut <- factor(prdt$cut, labels = c("Fair", "Good","Very Good","Premium","Ideal"), ordered = T)
prdt$color <-factor(prdt$color, labels = c("J", "I","H","G", "F","E","D"), ordered = T)
prdt$clarity <-factor(prdt$clarity, labels = c("I1", "SI2","SI1","VS2", "VS1","VVS2","VVS1","IF"), ordered = T)

shinyServer(function(input, output) {
        
        modelt <- reactive({
                paste("price ~", input$variable)
        })
        
        modeltp <- reactive({
                paste("price ~", "as.integer(", input$variable, ")")
        })
        
        fitmod <- reactive({
                lm(as.formula(modeltp()), data=prdt)
        })
        
        output$caption <- renderText({ modelt() 
        })
        
        output$prbplot <- renderPlot({
                boxplot(as.formula(modelt()),data = prdt,
                        outline = input$outliers)
                 
        })
        
        output$fitmod <- renderPrint({
                summary(fitmod())
        })
        
        output$prplot <- renderPlot({
                with(prdt, {plot(as.formula(modeltp()))
                           abline(fitmod(), col=5, size=8)
                })
        })
        
})

