# Load data ---------------------------------------------------------
basketball <- read.csv("bluedevilsbasketball.csv")


# Begin ui definition -----------------------------------------------
fluidPage(
  
  # App title -------------------------------------------------------
  titlePanel("Duke Basketball Data"),
  
  # Sidebar ---------------------------------------------------------
  sidebarLayout(
    sidebarPanel(
      
      # Select season
      selectInput("season",
                  "Season:",
                  choices = names(basketball$season)
      ),
      
      # Horizontal line separating population and sample input
      hr(),
      
      # Input sample size
      selectInput("location",
                  "Location",
                  choices = names(basketball$location)
      ),
      
    # Main panel ----------------------------------------------------
    mainPanel(
      
      # Plot population distribution
      plotOutput("monthlyRankingPlot"),
      
      # Horizontal line divider
      hr(),
      
      # Plot sampling distribution
      plotOutput("locationPlot")
      
    )
  ) 
)
)