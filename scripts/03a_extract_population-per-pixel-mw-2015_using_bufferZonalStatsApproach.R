## VG cool
## Jan 10 2019

library(raster)
library(rgdal)
library(rgeos)
library(magrittr)
library(tidyverse)
library(data.table)
library(geosphere)
library(plotKML)

## load access raster
popden <- raster("data/mw100m_population/MWI_ppp_2015_adj_v2.tif")

## load malawi hh point shp
hh_geo <- readOGR(dsn = "./data",layer = "mw16_hh_geo_sp_wgs84")

## check if CRS is same for both
identicalCRS(hh_geo,popden)

#extract and mutate popden data to hh geo
#hh_geo@data %<>% mutate(access_to_city15_nobuff = raster::extract(popden, hh_geo),
#                        access_to_city15_buff10k = raster::extract(popden, hh_geo,
#                                                                   buffer = 10000,
#                                                                   fun = mean,
#                                                                     ))


## create 10k buffer
source("scripts/make_GeodesicBuffer.R")
set.seed(1999)
hh_geo_sppoly <- SpatialPoints(hh_geo,proj4string = CRS(proj4string(hh_geo)))
buf_geo <- make_GeodesicBuffer(XY.dg = hh_geo_sppoly,dg.step = 5,
                               dst.m = 10^4, 
                               crs =
                                 "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0")


ppp10k <- raster::extract(popden, buf_geo, 
                          fun=sum, na.rm=TRUE, df=TRUE,weights=T)






b.box <- as(raster::extent(-120, 120, -60, 60), "SpatialPolygons")
proj4string(b.box) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"
set.seed(2017)
pts <- sp::spsample(b.box, n=100, type="regular")
buf1000km.geodesic <- make_GeodesicBuffer(XY.dg=pts,
                                          dg.step=5,
                                          dst.m=10^6,
                                          crs=proj4string(pts))

### buffering takes a long time
# run over small set
hh_geo@data %<>% mutate(popden_buff10k = NA)
for(i in seq(1,nrow(hh_geo),by=102)){
  hh_geo@data[i:(i+101),"popden_buff10k"] <-
    raster::extract(popden, hh_geo[i:(i+101),],
                    buffer = 10000, fun = sum)
  print(i)
}

## divide popden by 10 km sq
hh_geo@data %<>% mutate(popden_buff10k = popden_buff10k/(100*pi))

##store data on drive
write_rds(x = hh_geo,path="data/hhgeo_w_popden10k.rds",compress = "gz")



