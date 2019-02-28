## Process Hansen data

# inputs: Hansen data, LSMS geopoints
  ## Hansen files: treecover, lossyear, datamask
# outputs: attributes for baseline year 2007, attributes of loss area per year 2007-2017

## (1) Create bounding box from LSMS geopoints
library(spatstat)
bounding.box.xy()

## (2) Increase bounding box to account for sensititvity analyses (highest buffer = 50 km)

## (3) Consolidate Hansen tiles based on bounding box

## (4) Clip if necessary to bounding box

  ## (4a) Subset LSMS points and clipped rasters to calculate yearly forest loss and load
  library(raster)
  library(sp)
  library(spatstat)
  library(dplyr)
  library(rgdal)
  library(magrittr)
  library(tidyverse)

  mwhhgeo10 <- hh_geo <- readOGR(dsn = "./data",layer = "mw16_hh_geo_sp_wgs84")
  
  bound <- bounding.box.xy(mwhhgeo10@coords)
  
  hansen1 <- raster("C:/Users/kbran/OneDrive/Documents/R/paper1/datamask_00N_030E.tif")
  hansen2 <- raster("C:/Users/kbran/OneDrive/Documents/R/paper1/datamask_10S_030E.tif")
  han <- raster::merge(hansen1, hansen2, overlap = FALSE, ext = extent(32.4, 36.4, 
                                                                       -17.6, -8.93))
  

## (5) Buffer geopoints at 10 km and 50 km radius

