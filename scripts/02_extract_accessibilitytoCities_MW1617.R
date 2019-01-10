## VG cool
## Jan 10 2019

library(raster)
library(rgdal)
library(magrittr)

## load access raster
access <- raster("data/accessibility_to_cities_2015_v1.0/accessibility_to_cities_2015_v1.0.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mw16_hh_geo_sp_wgs84")

## check if CRS is same for both
identicalCRS(hh_geo,access)

#extract and mutate access data to hh geo
hh_geo@data %<>% mutate(access_to_city15_nobuff = raster::extract(access, hh_geo),
                        access_to_city15_buff10k = raster::extract(access, hh_geo,
                                                                   buffer = 10000,
                                                                   fun = mean))

##store data on drive
write_rds(hhgeo,"data/hhgeo_w_calculated_access.rds",compress = T)

### buffering takes a long time
# run over small set
hh_geo_subset <- hh_geo[1:100,]
access_to_city15_buff10k = raster::extract(access, hh_geo_subset,
                                           buffer = 10000)


