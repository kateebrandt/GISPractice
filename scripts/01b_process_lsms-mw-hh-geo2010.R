## KB
## Jan 30 2018

##process mw lsms 2010 hh geovariables for gis data creation

library(tidyverse)
library(rgdal)

raw <- read_csv("./data/householdgeovariablesIHS3.csv")

mw10_hh_geo <- raw %>% dplyr::select(1:4) %>% filter((!is.na(lat_modified)) & 
                                                       (!is.na(lon_modified)))

## rename columns so there's no writeOGR truncation error
  colnames(mw10_hh_geo)[colnames(mw10_hh_geo)=="lat_modified"] <- "lat"
  colnames(mw10_hh_geo)[colnames(mw10_hh_geo)=="lon_modified"] <- "lon"

## convert geo file to spatial points data frame 

mw10_hh_geo_sp <- SpatialPointsDataFrame(coords = as.matrix(mw10_hh_geo[,c(4,3)]),
                                         data = mw10_hh_geo[,1:4],
                                         proj4string = CRS("+init=epsg:4326"))



## write shapefile
writeOGR(mw10_hh_geo_sp, dsn = "data","mw10_hh_geo_sp_wgs84",driver="ESRI Shapefile",
         overwrite_layer = T)