## KB
## March 6 2019

library(raster)
library(rgdal)
library(magrittr)
library(tidyverse)

## Remember: 2013 data needs average between 2010 popden and 2015 popden
######################################################
# PART 1 - 2010 Popden for YEAR 1
## load access raster
popden <- raster("data/MWI_pph_2010_adj_v2.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlpy1_hh_geo_sp_wgs84")

## popden .tif needs to have projection changed
hh_geo_proj <- hh_geo %>% spTransform(crs(popden))

## check if CRS is same for both
identicalCRS(hh_geo_proj,popden)

## Extract 2010 popden to YEAR 1
hh_geo_proj@data %<>% mutate(popden_buff10k_2010 = NA)
#for(i in seq(1,nrow(hh_geo),by=102)){
for(i in 1:1619){
  hh_geo_proj@data[i,"popden_buff10k_2010"] <-
    raster::extract(popden, hh_geo[i,],
                    buffer = 10000, fun = sum)
  print(i)
}

hh_geo_proj@data$popden_buff10k_2010
## divide popden by 10 km sq
hh_geo_proj@data %<>% mutate(popden_buff10k_2010 = popden_buff10k_2010/(100*pi))

##store data on drive
write_rds(x = hh_geo_proj,path="data/hhgeolpy1_w_popden10k.rds",compress = "gz")

#####################################################################################
## PART 2 - 2010 and 2015 popden, averaged, for YEAR 2 (2013)

# No need to load popden, 2010 already loaded

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlpy2_hh_geo_sp_wgs84")

## popden .tif needs to have projection changed
hh_geo_proj <- hh_geo %>% spTransform(crs(popden))

## check if CRS is same for both
identicalCRS(hh_geo_proj,popden)

## PART 2A
## Extract 2010 popden to YEAR 2 
hh_geo_proj@data %<>% mutate(popden_buff10k_2010 = NA)

for(i in 1:1990){
  hh_geo_proj@data[i,"popden_buff10k_2010"] <-
    raster::extract(popden, hh_geo[i,],
                    buffer = 10000, fun = sum)
  print(i)
}

hh_geo_proj@data$popden_buff10k_2010
## divide popden by 10 km sq
hh_geo_proj@data %<>% mutate(popden_buff10k_2010 = popden_buff10k_2010/(100*pi))

## PART 2B
# Popden now 2015 data
popden <- raster("data/Malawi 100m Population (3)/MWI_pph_2015_adj_v2.tif")

## check if CRS is same for both
identicalCRS(hh_geo_proj,popden)

## Extract 2015 popden to YEAR 2 
hh_geo_proj@data %<>% mutate(popden_buff10k_2015 = NA)

for(i in 1:1990){
  hh_geo_proj@data[i,"popden_buff10k_2015"] <-
    raster::extract(popden, hh_geo[i,],
                    buffer = 10000, fun = sum)
  print(i)
}

hh_geo_proj@data$popden_buff10k_2015
## divide popden by 10 km sq
hh_geo_proj@data %<>% mutate(popden_buff10k_2015 = popden_buff10k_2015/(100*pi))


## PART 2C
## Create average of 2010 and 2015 for "2013" popden
hh_geo_proj@data %<>% mutate(popden_buff10k_2013 = (popden_buff10k_2010 + popden_buff10k_2015)/2)

##store data on drive
write_rds(x = hh_geo_proj,path="data/hhgeolpy2_w_popden10k_10_13_15.rds",compress = "gz")

#########################################################################################
## PART 3 - YEAR 3
# Access already loaded as 2015 data

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlpy3_hh_geo_sp_wgs84")

## popden .tif needs to have projection changed
hh_geo_proj <- hh_geo %>% spTransform(crs(popden))

## check if CRS is same for both
identicalCRS(hh_geo_proj,popden)

## Extract 2015 popden to YEAR 3
hh_geo_proj@data %<>% mutate(popden_buff10k_2015 = NA)

for(i in 1:2503){
  hh_geo_proj@data[i,"popden_buff10k_2015"] <-
    raster::extract(popden, hh_geo[i,],
                    buffer = 10000, fun = sum)
  print(i)
}

hh_geo_proj@data$popden_buff10k_2015
## divide popden by 10 km sq
hh_geo_proj@data %<>% mutate(popden_buff10k_2015 = popden_buff10k_2015/(100*pi))

##store data on drive
write_rds(x = hh_geo_proj,path="data/hhgeolpy3_w_popden10k_15.rds",compress = "gz")
