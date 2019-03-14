## KB
## March 13
## Create Baseline Forest Cover raster for analysis
## Basline year for this project = 2007

library(raster)
library(spatstat)
library(sp)
library(dplyr)
library(rgdal)
library(magrittr)
library(tidyverse)
library(stars)

# (1) Create 2007 forest cover raster

tc2000 <- raster("./data/han1617_tc2000.tif")
lossyr <- raster("./data/han1617_lossyr.tif")
mask <- raster("./data/han1617_dm.tif")

## Reclassify loss raster to include 1-6 as one value for loss
from <- c(0, 1, 7:17)
to <- c(0, 6, 7:17)
rec <- c(0, -1, 7:17)
reclass <- cbind(from, to, rec)

lossyr07 <- reclassify(lossyr, reclass)
tc07 <- overlay(tc2000, lossyr07,
                fun=function(tc2000, lossyr07) {
                  ifelse(lossyr07==-1, 0, tc2000)
                })
# Write tc07 as raster
# This is a raster of tree cover per pixel in 2007, values 0-100 represent %tree cover 
writeRaster(tc07, filename = "./processed/tc07.tif", format = "GTiff", overwrite = TRUE)

## Create loss year rasters for each year 2007-2017
#2007
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0)
reclass <- cbind(from, to)
loss07 <- reclassify(lossyr, reclass)
writeRaster(loss07, filename = "./data/loss07a.tif", format = "GTiff", overwrite = TRUE)

#2008
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0)
reclass <- cbind(from, to)
loss08 <- reclassify(lossyr, reclass)
writeRaster(loss08, filename = "./data/loss08.tif", format = "GTiff", overwrite = TRUE)

#2009
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0)
reclass <- cbind(from, to)
loss09 <- reclassify(lossyr, reclass)
writeRaster(loss09, filename = "./data/loss09.tif", format = "GTiff", overwrite = TRUE)

#2010
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0)
reclass <- cbind(from, to)
loss10 <- reclassify(lossyr, reclass)
writeRaster(loss10, filename = "./data/loss10.tif", format = "GTiff", overwrite = TRUE)

#2011
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0)
reclass <- cbind(from, to)
loss11 <- reclassify(lossyr, reclass)
writeRaster(loss11, filename = "./data/loss11.tif", format = "GTiff", overwrite = TRUE)

#2012
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0)
reclass <- cbind(from, to)
loss12 <- reclassify(lossyr, reclass)
writeRaster(loss12, filename = "./data/loss12.tif", format = "GTiff", overwrite = TRUE)

#2013
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0)
reclass <- cbind(from, to)
loss13 <- reclassify(lossyr, reclass)
writeRaster(loss13, filename = "./data/loss13.tif", format = "GTiff", overwrite = TRUE)

#2014
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0)
reclass <- cbind(from, to)
loss14 <- reclassify(lossyr, reclass)
writeRaster(loss14, filename = "./data/loss14.tif", format = "GTiff", overwrite = TRUE)

#2015
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0)
reclass <- cbind(from, to)
loss15 <- reclassify(lossyr, reclass)
writeRaster(loss15, filename = "./data/loss15.tif", format = "GTiff", overwrite = TRUE)

#2016
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0)
reclass <- cbind(from, to)
loss16 <- reclassify(lossyr, reclass)
writeRaster(loss16, filename = "./data/loss16.tif", format = "GTiff", overwrite = TRUE)

#2017
from <- c(0:17)
to <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1)
reclass <- cbind(from, to)
loss17 <- reclassify(lossyr, reclass)
writeRaster(loss17, filename = "./data/loss17.tif", format = "GTiff", overwrite = TRUE)


