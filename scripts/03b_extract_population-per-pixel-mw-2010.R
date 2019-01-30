## VG cool
## Jan 10 2019

library(raster)
library(rgdal)
library(magrittr)
library(tidyverse)

## load access raster
popden <- raster("data/MWI_pph_2010_adj_v2.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mw10_hh_geo_sp_wgs84")

## popden .tif needs to have projection changed
hh_geo_proj <- hh_geo %>% spTransform(crs(popden))

## check if CRS is same for both
identicalCRS(hh_geo_proj,popden)

#extract and mutate popden data to hh geo
#hh_geo@data %<>% mutate(access_to_city15_nobuff = raster::extract(popden, hh_geo),
#                        access_to_city15_buff10k = raster::extract(popden, hh_geo,
#                                                                   buffer = 10000,
#                                                                   fun = mean,
#                                                                     ))



### buffering takes a long time
# run over small set

  ## Jan 30 - had to calculate inefficiently :(
hh_geo_proj@data %<>% mutate(popden_buff10k = NA)
#for(i in seq(1,nrow(hh_geo),by=102)){
  for(i in 1:12271){
  hh_geo_proj@data[i,"popden_buff10k"] <-
    raster::extract(popden, hh_geo[i,],
                    buffer = 10000, fun = sum)
  print(i)
}

hh_geo_proj@data$popden_buff10k
## divide popden by 10 km sq
hh_geo@data %<>% mutate(popden_buff10k = popden_buff10k/(100*pi))

##store data on drive
write_rds(x = hh_geo,path="data/hhgeo10_w_popden10k.rds",compress = "gz")



