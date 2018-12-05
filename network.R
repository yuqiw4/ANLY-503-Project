# Network D3
setwd("C:/Users/45336/Desktop/2018 Fall/503/Project/Part 2 code")


# Load package
library(networkD3)

#####################################################

# Load data
edgeList <- read.csv('edgelist.csv', encoding = 'utf-8', stringsAsFactors = F)
nodeList <- read.csv('nodelist.csv', encoding = 'utf-8', stringsAsFactors = F)


network_crime <- networkD3::forceNetwork(Links = edgeList, # data frame that contains info about edges
            Nodes = nodeList, # data frame that contains info about nodes
            Source = "SourceID", # ID of source node 
            Target = "TargetID", # ID of target node
            Value = "Weight", # value from the edge list (data frame) that will be used to value/weight relationship amongst nodes
            NodeID = "nName",
            Nodesize = "nodesize",
            colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"),
            Group = "nodetype",  # value from the node list (data frame) that contains value we want to use for node color
            height = 500, # Size of the plot (vertical)
            width = 1000,  # Size of the plot (horizontal)
            fontSize = 20, # Font size
            linkDistance = networkD3::JS("function(d) { return 100*d.value; }"), # Function to determine distance between any two nodes, uses variables already defined in forceNetwork function (not variables from a data frame)
            linkWidth = networkD3::JS("function(d) { return d.value; }"),# Function to determine link/edge thickness, uses variables already defined in forceNetwork function (not variables from a data frame)
            opacity = 0.85, # opacity
            zoom = TRUE, # ability to zoom when click on the node
            legend = TRUE,
            opacityNoHover = 0.1) 

# Plot network
network_crime 

# Save network as html file
networkD3::saveNetwork(network_crime, "network_crime.html", selfcontained = TRUE)

