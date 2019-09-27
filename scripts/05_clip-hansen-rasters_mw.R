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
  library(raster)
  library(sp)
  library(dplyr)
  library(rgdal)
  library(magrittr)
  library(tidyverse)
  library(stars)

  mwhhgeo16 <- hh_geo <- readOGR(dsn = "./data",layer = "mw16_hh_geo_sp_wgs84")
  
  bound <- bounding.box.xy(mwhhgeo16@coords)
  bound
  #rectangle = [32.85958, 35.85383] x [-17.09515, -9.429667] units
  # (1) closer to 0, (2) further from 0, (3) further from 0, (4) closer to 0
####  
  ## Create data mask raster
  hansen1 <- raster("./data/datamask_00N_030E.tif")
  hansen2 <- raster("./data/datamask_10S_030E.tif")
  han <- raster::merge(hansen1, hansen2, overlap = FALSE, ext = extent(32.4, 36.4, 
                                                                       -17.6, -8.93))
  writeRaster(han, filename = "./processed/han1617_dm.tif", format = "GTiff", overwrite = TRUE)
####  
  ## Create first year (2000) raster forest cover
  hansen1 <- raster("./data/first_00N_030E.tif")
  hansen2 <- raster("./data/first_10S_030E.tif")
  han <- raster::merge(hansen1, hansen2, overlap = FALSE, ext = extent(32.4, 36.4, 
                                                                       -17.6, -8.93))
  writeRaster(han, filename = "./processed/han1617_first.tif", format = "GTiff", overwrite = TRUE)
####
  # Create loss year raster
  hansen1 <- raster("./data/lossyear_00N_030E.tif")
  hansen2 <- raster("./data/lossyear_10S_030E.tif")
  han <- raster::merge(hansen1, hansen2, overlap = FALSE, ext = extent(32.4, 36.4, 
                                                                       -17.6, -8.93))
  writeRaster(han, filename = "./processed/han1617_lossyr.tif", format = "GTiff", overwrite = TRUE)
####
  # Create tree cover 2000 raster
  hansen1 <- raster("./data/treecover2000_00N_030E.tif")
  hansen2 <- raster("./data/treecover2000_10S_030E.tif")
  han <- raster::merge(hansen1, hansen2, overlap = FALSE, ext = extent(32.4, 36.4, 
                                                                       -17.6, -8.93))
  writeRaster(han, filename = "./processed/han1617_tc2000.tif", format = "GTiff", overwrite = TRUE)

  

