## KB
## March 22
## Condensing unique GPS points for processing

library(dplyr)
library(tidyverse)
library(rgdal)

hhgeo10 <- readOGR(dsn = "/data", layer = "mw10_hh_geo_sp_wgs84")
hhgeo10 <- hhgeo10@data
hhgeo10_pts <- unique(hhgeo10[,c(2:4)])

mw10un_hh_geo_sp <- SpatialPointsDataFrame(coords = as.matrix(hhgeo10_pts[,c(3,2)]),
                                         data = hhgeo10_pts,
                                         proj4string = CRS("+init=epsg:4326"))

writeOGR(mw10un_hh_geo_sp, dsn = "data","mw10un_hh_geo_sp_wgs84",driver="ESRI Shapefile",
         overwrite_layer = T)


hhgeo16 <- readOGR(dsn = "./data", layer = "mw16_hh_geo_sp_wgs84")
hhgeo16 <- hhgeo16@data
hhgeo16_pts <- unique(hhgeo16[,c(3,4)])
hhgeo16_pts <- hhgeo16_pts %>% mutate(id = 1:780)

mw16un_hh_geo_sp <- SpatialPointsDataFrame(coords = as.matrix(hhgeo16_pts[,c(2,1)]),
                                           data = hhgeo16_pts,
                                           proj4string = CRS("+init=epsg:4326"))

writeOGR(mw16un_hh_geo_sp, dsn = "data", "mw16un_hh_geo_sp_wgs84", driver = "ESRI Shapefile", overwrite_layer = T)
