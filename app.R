library(shiny)

motorVehicleDeaths <- read.csv("Motor_Vehicle_Occupant_Death_Rate__by_Age_and_Gender__2012___2014__All_States.csv")
motorVehicleDeaths <- motorVehicleDeaths[2:53, ]

ui <- dashboardPage(
  
  skin = "black",
    dashboardHeader(title = "Motor Vehicle Occupant Death Rate By Age: 2012 and 2014", titleWidth = 250),
      dashboardSidebar( width = 350,
        sidebarMenu(
          menuItem("All Ages Plot", tabName = "allAges", icon = icon("allAges")),
          menuItem("Ages 0 - 20", tabName = "ages0-20", icon = icon("ages0-20")),
          menuItem("Ages 21 - 34", tabName = "ages21-34", icon = icon("ages21-34")),
          menuItem("Ages 35 - 54", tabName = "ages35-54", icon = icon("ages35-54")),
          menuItem("Ages 55 and Older", tabName = "ages55+", icon = icon("ages55+")),
          menuItem("Data Table", tabName = "dataTable", icon = icon("DataTable"))
        
        )
      ),
  
   dashboardBody(
     tabItems(
       tabItem( tabName = "allAges",
                fluidRow(
                  box(plotOutput("plotAllAges"))
                ) 
         
              ),
       
       tabItem( tabName = "ages0-20", 
                fluidRow(
                  box(plotOutput(("plotAges0-24"))
                )
                
              ),
              
       tabItem( tabName = "ages21-34", 
                fluidRow(
                  box(plotOutput("plotAges21-34"))
                )
                
              ),
       
       tabItem( tabName = "ages35-54", 
                fluidRow(
                  box(plotOutput("plotAges35-54"))
                )
                
              ),
       
       tabItem( tabName = "ages55+",
                fluidRow(
                  box(plotOutput("plotAges55+"))
                )
              
              ),
       
       tabItem( tabName = "dataTable",
                fluidRow(
                  box(tableOutput("table"))
          )
        )
      )
    )
  )
)

  
server <- function( input, output ){
  
  
}

shinyApp( ui = ui, server = server )