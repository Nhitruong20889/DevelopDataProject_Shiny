library(shiny)

shinyUI(
        navbarPage("Shiny Application",
                   tabPanel("Analysis",
                            fluidPage(
                                titlePanel("The relationship between variables and Diamonds' prices"),
                                    sidebarLayout(
                                        sidebarPanel(
                                                   selectInput("variable", "Input Variable:",
                                                                c("The weight of diamonds" = "carat",
                                                                  "Diamonds color" = "color",
                                                                  "How clear of the diamonds"="clarity",
                                                                  "Quality of that cut"="cut",
                                                                  "Total depth percentage" = "depth",
                                                                  "Width of topof diamonds" = "table"
                                                                  
                                                                )),
                                                    
                                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                            ),
                                            
                                            mainPanel(
                                                    h3(textOutput("caption")),
                                                    
                                                    tabsetPanel(type = "tabs", 
                                                                tabPanel("BoxPlot graph", plotOutput("prbplot")),
                                                                tabPanel("Linear Regression model", 
                                                                         plotOutput("prplot"),
                                                                         verbatimTextOutput("fitmod")
                                                                )
                                                    )
                                            )
                                    )
                            )
                   ),
                   
                   tabPanel("Data detail",
                            h2("Diamonds"),
                            hr(),
                            h3("Description"),
                            helpText("TA dataset containing the prices and other attributes of almost 54,000 diamonds. The variables are as follows"),
                                     
                            h3("Format"),
                            p("A data frame with 53940 observations on 10 variables."),
                            
                            p("  [, 1]   price   US dollars_ $326–$18,823"),
                            p("  [, 2]	 carat	 weight of the diamond (0.2–5.01)"),
                            p("  [, 3]	 cut	 quality of the cut (Fair, Good, Very Good, Premium, Ideal)"),
                            p("  [, 4]	 color	 diamond colour, from D (best) to J (worst)"),
                            p("  [, 5]	 clarity	 a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))"),
                            p("  [, 6]	 x	 length in mm (0–10.74)"),
                            p("  [, 7]	 y	 width in mm (0–58.9)"),
                            p("  [, 8]	 z	 depth in mm (0–31.8)"),
                            p("  [, 9]	 depth	 total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43–79)"),
                            p("  [,10]	 table	 width of top of diamond relative to widest point (43–95)"),
                            
                   ),
           
                   tabPanel("My Github repository",
                            a("https://github.com/Nhitruong20889/DevelopDataProject_Shiny"),
                            hr(),
                            h4("The repository is Develop Data Products Project_Shiny")
                   )        
        )
)
