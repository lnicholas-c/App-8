library(shiny)

motorVehicleDeaths <- read.csv("Motor_Vehicle_Occupant_Death_Rate__by_Age_and_Gender__2012___2014__All_States.csv")
motorVehicleDeaths <- motorVehicleDeaths[2:53, ]

ui <- dashboardPage(
  
  skin = "black",
    dashboardHeader(title = "Motor Vehicle Occupant Death Rate By Age", titleWidth = 450),
      dashboardSidebar( width = 250,
        sidebarMenu(
          menuItem("All Ages", tabName = "allAges", icon = icon("allAges")),
          menuItem("Ages 0 - 20", tabName = "ages0", icon = icon("ages0")),
          menuItem("Ages 21 - 34", tabName = "ages21", icon = icon("ages21")),
          menuItem("Ages 35 - 54", tabName = "ages35", icon = icon("ages35")),
          menuItem("Ages 55 and Older", tabName = "ages55", icon = icon("ages55")),
          menuItem("Data Table", tabName = "dataTable", icon = icon("DataTable"))
        
        )
      ),
  
   dashboardBody(
     tabItems(
       tabItem( tabName = "allAges",
                fluidRow(
                  box(plotOutput("plotAllAges")
                  )
                )
              ),
       
       tabItem( tabName = "ages0", 
                fluidRow(
                  box(plotOutput("plotAges0")
                  )
                )
              ),
              
       tabItem( tabName = "ages21", 
                fluidRow(
                  box(plotOutput("plotAges21")
                  )
                )
              ),
       
       tabItem( tabName = "ages35", 
                fluidRow(
                  box(plotOutput("plotAges35")
                  )
                )
              ),
       
       tabItem( tabName = "ages55",
                fluidRow(
                  box(plotOutput("plotAges55")
                  )
                )
              ),
       
       tabItem( tabName = "dataTable",
                fluidRow(
                  box(dataTableOutput("table")
                  )
                )        
              )
    )
  )
)


server <- function( input, output ){
  
  output$plotAllAges <- renderPlot({
    plot( motorVehicleDeaths$All.Ages..2012, motorVehicleDeaths$All.Ages..2014,
          xlab = "Deaths Among All Ages: 2012", ylab = "Deaths Among All Ages: 2014", 
          main = "All Ages: 2012 vs. 2014")
    
  })
  
  output$plotAges0 <- renderPlot({
    plot( motorVehicleDeaths$Age.0.20..2012, motorVehicleDeaths$Age.0.20..2014,
          xlab = "Deaths Among People Ages 0-20: 2012", ylab = "Deaths Among People Ages 0-20: 2014", 
          main = "Ages 0 - 20: 2012 vs. 2014")
    
  })
  
  output$plotAges21 <- renderPlot({
    plot( motorVehicleDeaths$Age.21.34..2012, motorVehicleDeaths$Age.21.34..2014,
          xlab = "Deaths Among People Ages 21-34: 2012", ylab = "Deaths Among People Ages 21-34: 2014", 
          main = "Ages 21 - 34: 2012 vs. 2014")
    
    
  })
  
  output$plotAges35 <- renderPlot({
    plot( motorVehicleDeaths$Age.35.54..2012, motorVehicleDeaths$Age.35.54..2014,
          xlab = "Deaths Among People Ages 35-54: 2012", ylab = "Deaths Among People Ages 35-54: 2014", 
          main = "Ages 35 - 54: 2012 vs. 2014")
    
  })
  
  output$plotAges55 <- renderPlot({
    plot( motorVehicleDeaths$Age.55...2012, motorVehicleDeaths$Age.55...2014,
          xlab = "Deaths Among People Ages 55 And Older: 2012", ylab = "Deaths Among People Ages 55 And Older: 2014", 
          main = "Ages 55 And Odler: 2012 vs. 2014")
    
  })
  
  output$table <- renderDataTable({
    motorVehicleDeaths
  })
  
}

shinyApp( ui = ui, server = server )