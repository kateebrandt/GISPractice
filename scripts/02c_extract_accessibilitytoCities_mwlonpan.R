## KB
## February 4 2019

library(raster)
library(rgdal)
library(magrittr)
library(tidyverse)

## load access raster - Use 2010 data for 2010 survey
access <- raster("data/accessibility_to_cities_2015_v1.0.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlonpan_hh_geo_sp_wgs84")

## check if CRS is same for both
identicalCRS(hh_geo,access)


#extract and mutate access data to hh geo
#hh_geo@data %<>% mutate(access_to_city15_nobuff = raster::extract(access, hh_geo),
#                        access_to_city15_buff10k = raster::extract(access, hh_geo,
#                                                                   buffer = 10000,
#                                                                   fun = mean,
#                                                                     ))

### buffering takes a long time
# run over small set
hh_geo@data %<>% mutate(access_to_city15_buff10k = NA)
for(i in 1:1619){
  hh_geo@data[i,"access_to_city15_buff10k"] <-
    raster::extract(access, hh_geo[i,],
                    buffer = 10000, fun = mean)
  print(i)
}

write_rds(x = hh_geo,path="data/hhgeolonpan_w_calculated_access.rds",compress = "gz")

## Check output
hh_geo@data[1:20,]
summary(hh_geo@data$access_to_city15_buff10k)
