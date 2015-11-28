library(ggplot2)
library(dplyr)

# Load data ---------------------------------------------------------
basketball <- read.csv("bluedevilsbasketball.csv")

# Begin server definition -------------------------------------------

shinyServer(
  function(input, output){
    
    # Assign selected population distribution -----------------------
    
    # make reactive to be usable in later objects
    #pop_dist <- reactive(unlist(select(pops, matches(input$pop))))
    
    # Plot Average Duke Ranking per Month for each Season ----------------------------------
    output$monthlyRankingPlot <- renderPlot({
      
      seasonOnly <- basketball %>%
        filter(season == input$season)
      
      seasonOnly %>%
        summarise(avg_rank = mean(dukerank)) %>%
        ggplot(aes(x = date, y = avg_rank)) +
          geom_histogram() +
          ggtitle(paste0("Average Duke Ranking per Month for Season",input$season))
      
    })
    
    output$locationPlot <- renderPlot({
      
      locationOnly <- basketball %>%
        filter(location == input$location)
      
      locationOnly %>%
        summarise(countLocation = count(location)) %>%
        ggplot(aes(x = location, y = countLocation, color = season)) +
        geom_histogram() +
        ggtitle("Number of Times Played at Each Location")
      
    })
#       HTML(paste0("Sampling distribution of sample means from samples 
#            of size ", input$n,  ": <br/>", "mean = ", sampling_mean, 
#                   ", standard error = ", sampling_se))
#       
     })
  
