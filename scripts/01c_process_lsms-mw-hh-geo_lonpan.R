## KB
## March 6 2019

##process mw lsms long panel hh geovariables for gis data creation

library(tidyverse)
library(rgdal)
library(haven)
library(dplyr)

## YEAR 1 - 2010
rawy1 <- read.csv("./data/2010y1panel.csv")

mwlpy1_hh_geo <- rawy1 %>% dplyr::select(1:4) %>% filter((!is.na(lat_modified)) & 
                                                       (!is.na(lon_modified)))

## rename columns so there's no writeOGR truncation error
colnames(mwlpy1_hh_geo)[colnames(mw10_hh_geo)=="lat_modified"] <- "lat"
colnames(mwlpy1_hh_geo)[colnames(mw10_hh_geo)=="lon_modified"] <- "lon"

## convert geo file to spatial points data frame 

mwlpy1_hh_geo_sp <- SpatialPointsDataFrame(coords = as.matrix(mwlpy1_hh_geo[,c(4,3)]),
                                         data = mwlpy1_hh_geo[,1:4],
                                         proj4string = CRS("+init=epsg:4326"))



## write shapefile
writeOGR(mwlpy1_hh_geo_sp, dsn = "data","mwlpy1_hh_geo_sp_wgs84",driver="ESRI Shapefile",
         overwrite_layer = T)

##############
## YEAR 2 - 2013
rawy2 <- read.csv("./data/2013y2panel.csv")

mwlpy2_hh_geo <- rawy2 %>% dplyr::select(c(1,49:55)) %>% filter((!is.na(LAT_DD_MOD)) & 
                                                           (!is.na(LON_DD_MOD)))

## rename columns so there's no writeOGR truncation error
colnames(mwlpy2_hh_geo)[colnames(mwlpy2_hh_geo)=="LAT_DD_MOD"] <- "lat"
colnames(mwlpy2_hh_geo)[colnames(mwlpy2_hh_geo)=="LON_DD_MOD"] <- "lon"

## convert geo file to spatial points data frame 

mwlpy2_hh_geo_sp <- SpatialPointsDataFrame(coords = as.matrix(mwlpy2_hh_geo[,c(3,2)]),
                                           data = mwlpy2_hh_geo[,1:8],
                                           proj4string = CRS("+init=epsg:4326"))



## write shapefile
writeOGR(mwlpy2_hh_geo_sp, dsn = "data","mwlpy2_hh_geo_sp_wgs84",driver="ESRI Shapefile",
         overwrite_layer = T)

###############
## YEAR 3 - 2016-17
rawy3 <- read_dta("./data/2016y3panel.dta")

mwlpy3_hh_geo <- rawy3 %>% dplyr::select(c(1:3,39:46)) %>% filter((!is.na(lat_modified)) & 
                                                                  (!is.na(lon_modified)))

## rename columns so there's no writeOGR truncation error
colnames(mwlpy3_hh_geo)[colnames(mwlpy3_hh_geo)=="lat_modified"] <- "lat"
colnames(mwlpy3_hh_geo)[colnames(mwlpy3_hh_geo)=="lon_modified"] <- "lon"

## convert geo file to spatial points data frame 

mwlpy3_hh_geo_sp <- SpatialPointsDataFrame(coords = as.matrix(mwlpy3_hh_geo[,c(3,2)]),
                                           data = mwlpy3_hh_geo[,1:11],
                                           proj4string = CRS("+init=epsg:4326"))



## write shapefile
writeOGR(mwlpy3_hh_geo_sp, dsn = "data","mwlpy3_hh_geo_sp_wgs84",driver="ESRI Shapefile",
         overwrite_layer = T)
