## KB
## Jan 30 2019

library(raster)
library(rgdal)
library(magrittr)
library(tidyverse)

## load access raster - Use 2010 data for 2010 survey
access <- raster("data/mw100m_population/MWI_pph_2010_adj_v2.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mw10_hh_geo_sp_wgs84")


## Jan 30 - NOTE: Access is has different projection. Changed here:
crs(access) <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

## check if CRS is same for both
  identicalCRS(hh_geo,access)
  
  
#extract and mutate access data to hh geo
#hh_geo@data %<>% mutate(access_to_city15_nobuff = raster::extract(access, hh_geo),
#                        access_to_city15_buff10k = raster::extract(access, hh_geo,
#                                                                   buffer = 10000,
#                                                                   fun = mean,
#                                                                     ))

##store data on drive
write_rds(x = hh_geo,path="data/hhgeo_w_calculated_access.rds",compress = "gz")

### buffering takes a long time
# run over small set
hh_geo@data %<>% mutate(access_to_city15_buff10k = NA)
for(i in seq(1,nrow(hh_geo),by=102)){
  hh_geo@data[i:(i+101),"access_to_city15_buff10k"] <-
    raster::extract(access, hh_geo[i:(i+101),],
                    buffer = 10000, fun = mean)
  print(i)
}

##store data on drive
write_rds(x = hh_geo,path="data/hhgeo10_w_access.rds",compress = "gz")

