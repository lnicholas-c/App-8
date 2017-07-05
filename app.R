library(shiny)

motorVehicleDeaths <- read.csv("Motor_Vehicle_Occupant_Death_Rate__by_Age_and_Gender__2012___2014__All_States.csv")

ui <- dashboardPage(
  
  skin = "black",
    dashboardHeader(title = "Motor Vehicle Occupant Death Rate", titleWidth = 250),
      dashboardSidebar( width = 350,
        sidebarMenu(
  
        
        )
      ) 
   )

  
server <- function( input, output ){
  
  
}

shinyApp( ui = ui, server = server )