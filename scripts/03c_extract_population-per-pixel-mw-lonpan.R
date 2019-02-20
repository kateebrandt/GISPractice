## KB
## February 4 2019

library(raster)
library(rgdal)
library(magrittr)
library(tidyverse)

## 2013 data needs average between 2010 popden and 2015 popden
######################################################
# PART 1 - 2010 Popden
## load access raster
popden <- raster("data/MWI_pph_2010_adj_v2.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlonpan_hh_geo_sp_wgs84")

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

## Feb 4 - had to calculate inefficiently :(
hh_geo_proj@data %<>% mutate(popden_buff10k = NA)
#for(i in seq(1,nrow(hh_geo),by=102)){
for(i in 1:1619){
  hh_geo_proj@data[i,"popden_buff10k"] <-
    raster::extract(popden, hh_geo[i,],
                    buffer = 10000, fun = sum)
  print(i)
}

hh_geo_proj@data$popden_buff10k
## divide popden by 10 km sq
hh_geo_proj@data %<>% mutate(popden_buff10k = popden_buff10k/(100*pi))

##store data on drive
write_rds(x = hh_geo_proj,path="data/hhgeolonpan_w_popden10k.rds",compress = "gz")

#####################################################################################
## PART 2 - 2015 Popden

# load 2015 raster
popden <- raster("data/Malawi 100m Population (3)/MWI_pph_2015_adj_v2.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mwlonpan_hh_geo_sp_wgs84")

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

## Feb 4 - had to calculate inefficiently :(
hh_geo_proj@data %<>% mutate(popden_buff10k_15 = NA)
#for(i in seq(1,nrow(hh_geo),by=102)){
for(i in 1:1619){
  hh_geo_proj@data[i,"popden_buff10k_15"] <-
    raster::extract(popden, hh_geo[i,],
                    buffer = 10000, fun = sum)
  print(i)
}

hh_geo_proj@data$popden_buff10k_15
## divide popden by 10 km sq
hh_geo_proj@data %<>% mutate(popden_buff10k_15 = popden_buff10k_15/(100*pi))

##store data on drive
write_rds(x = hh_geo_proj,path="data/hhgeolonpan_w_popden10k_15.rds",compress = "gz")

#########################################################################################
## PART 3 - Merge data frames and average the two years' values

popden2010 <- readRDS("./data/hhgeolonpan_w_popden10k.rds")
popden2015 <- readRDS("./data/hhgeolonpan_w_popden10k_15.rds")

popden2010 <- popden2010@data
popden2015 <- popden2015@data

popdens2 <- merge(popden2010, popden2015)

popdens2 <- mutate(popdens2, popden10k_av_2013 = (popden_buff10k + popden_buff10k_15)/2)

write_rds(x = popdens2, path="data/hhgeolonpan_w_popden10k_comp.rds",compress = "gz")


