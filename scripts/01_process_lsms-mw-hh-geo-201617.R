## VG
## Jan 10 2018

##process mw lsms 2016-17 hh geovariables for gis data creation

library(tidyverse)
library(rgdal)

raw <- read_csv("data/HouseholdGeovariablesIHS4.csv")

mw16_hh_geo <- raw %>% select(1:4) %>% filter((!is.na(lat_modified)) & 
                                                (!is.na(lon_modified))) %>%
  mutate(pop = rnorm(nrow(mw16_hh_geo))) %>% select(-pop)

## convert geo file to spatial points data frame 

mw16_hh_geo_sp <- SpatialPointsDataFrame(coords = as.matrix(mw16_hh_geo[,c(4,3)]),
                                      data = mw16_hh_geo[,1:4],
                                      proj4string = CRS("+init=epsg:4326"))

## write shapefile
writeOGR(mw16_hh_geo_sp,"./data/","mw16_hh_geo_sp_wgs84",driver="ESRI Shapefile",
         overwrite_layer = T)