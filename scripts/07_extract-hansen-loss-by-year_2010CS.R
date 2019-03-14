## KB
## March 13 2019
## Extract tree cover in buffers surrounding points
## Extract each year of loss by points
library(rgdal)
library(raster)
library(dplyr)
library(tidyverse)

# (1) Cross section - 2010 

hh_geo <- readOGR(dsn = "./data",layer = "mw10_hh_geo_sp_wgs84")
tc07 <- raster("./processed/tc07.tif")
lossyr <- raster("./data/loss07.tif")
# check if CRS match
identicalCRS(hh_geo, lossyr)
identicalCRS(hh_geo, tc07)
###########################################################################################
# Part A
# Extract total # of cells lost within 10 km buffer for years 2007-2010, converted to area
## (2007)
hh_geo@data %<>% mutate(loss07_10k = NA)
#Select all cells = 7
for(i in 100:12271){
  hh_geo@data[i,"loss07_10k"] <-
    raster::extract(lossyr, hh_geo[i,],
                    buffer = 10000, fun = sum)
  print(i)
}

## Convert cell total to area
hh_geo@data %>% mutate(loss07_10km = loss07_10k*900)

##store data on drive
write_rds(x = hh_geo,path="data/hhgeo10_07loss10k.rds",compress = "gz")

#############################################################################
## (2008)
hh_geo <- read_rds("./data/hhgeo10_07loss10k.rds")
lossyr08 <- raster("./data/loss08.tif")
lossyr09 <- raster("./data/loss09.tif")
lossyr10 <- raster("./data/loss10.tif")
hh_geo@data %>% mutate(loss08_10k = NA, loss09_10k = NA, loss10_10k = NA,
                       loss07_50k = NA, loss08_50k = NA, loss09_50k = NA, loss10_50k = NA)
#Select all cells = 7
for(i in 1:12271){
  hh_geo@data[i,"loss08_10k"] <-
    raster::extract(lossyr08, hh_geo[i,],
                    buffer = 10000, fun = sum) 
    hh_geo@data[i,"loss09_10k"] <-
      raster::extract(lossyr09, hh_geo[i,],
                      buffer = 10000, fun = sum)
      hh_geo@data[i,"loss10_10k"] <-
        raster::extract(lossyr10, hh_geo[i,],
                        buffer = 10000, fun = sum)
      hh_geo@data[i,"loss07_50k"] <-
        raster::extract(lossyr, hh_geo[i,],
                        buffer = 10000, fun = sum)
      hh_geo@data[i,"loss08_50k"] <-
        raster::extract(lossyr08, hh_geo[i,],
                        buffer = 10000, fun = sum)
      hh_geo@data[i,"loss09_50k"] <-
        raster::extract(lossyr09, hh_geo[i,],
                        buffer = 10000, fun = sum)
      hh_geo@data[i,"loss10_50k"] <-
        raster::extract(lossyr10, hh_geo[i,],
                        buffer = 10000, fun = sum)
  
  print(i)
}

## Convert cell total to area
hh_geo@data %>% mutate(loss07_10km = loss07_10k*900,
                       loss08_10km = loss08_10k*900,
                       loss09_10km = loss09_10k*900,
                       loss10_10km = loss10_10k*900,
                       loss07_50km = loss07_50k*900,
                       loss08_50km = loss08_50k*900,
                       loss09_50km = loss09_50k*900,
                       loss10_50km = loss10_50k*900)

##store data on drive
write_rds(x = hh_geo,path="data/hhgeo10_loss10k_50k.rds",compress = "gz")




