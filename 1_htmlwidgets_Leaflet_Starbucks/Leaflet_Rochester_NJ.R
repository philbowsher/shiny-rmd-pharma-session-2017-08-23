download.file("https://opendata.socrata.com/api/views/ddym-zvjk/rows.csv?accessType=DOWNLOAD",destfile="data.csv")

starbucks1 <- read.csv("data.csv")

View(starbucks1)

starbucks <- starbucks1[ which(starbucks1$State=='NJ' 
                               & starbucks1$Country== 'US'), ]

View(starbucks)

library("leaflet") 

leaflet() %>% addTiles() %>% setView(-74.847160, 40.292916, zoom = 14) %>% 
  
  addMarkers(data = starbucks, lat = ~ Latitude, lng = ~ Longitude, popup = starbucks$Name)
