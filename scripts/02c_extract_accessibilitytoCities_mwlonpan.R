## KB
## February 4 2019

library(raster)
library(rgdal)
library(magrittr)
library(tidyverse)

## YEAR 1 - 2010
## load access raster - Use 2010 data for 2010 survey
access <- raster("data/accessibility_to_cities_2015_v1.0.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlpy1_hh_geo_sp_wgs84")

## check if CRS is same for both
identicalCRS(hh_geo,access)


#Extract access
hh_geo@data %<>% mutate(access_to_city15_buff10k = NA)
for(i in 1:1619){
  hh_geo@data[i,"access_to_city15_buff10k"] <-
    raster::extract(access, hh_geo[i,],
                    buffer = 10000, fun = mean)
  print(i)
}

write_rds(x = hh_geo,path="data/hhgeolpy1_w_calculated_access.rds",compress = "gz")

## Check output
hh_geo@data[1:20,]
summary(hh_geo@data$access_to_city15_buff10k)

############################################
## YEAR 2 - 2013
## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlpy2_hh_geo_sp_wgs84")

## check if CRS is same for both
identicalCRS(hh_geo,access)


#Extract access
hh_geo@data %<>% mutate(access_to_city15_buff10k = NA)
for(i in 1:1990){
  hh_geo@data[i,"access_to_city15_buff10k"] <-
    raster::extract(access, hh_geo[i,],
                    buffer = 10000, fun = mean)
  print(i)
}

write_rds(x = hh_geo,path="data/hhgeolpy2_w_calculated_access.rds",compress = "gz")

## Check output
hh_geo@data[1:20,]
summary(hh_geo@data$access_to_city15_buff10k)

##############################################
## YEAR 3
## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlpy3_hh_geo_sp_wgs84")

## check if CRS is same for both
identicalCRS(hh_geo,access)


#Extract access
hh_geo@data %<>% mutate(access_to_city15_buff10k = NA)
for(i in 1:2503){
  hh_geo@data[i,"access_to_city15_buff10k"] <-
    raster::extract(access, hh_geo[i,],
                    buffer = 10000, fun = mean)
  print(i)
}

write_rds(x = hh_geo,path="data/hhgeolpy3_w_calculated_access.rds",compress = "gz")

## Check output
hh_geo@data[1:20,]
summary(hh_geo@data$access_to_city15_buff10k)
