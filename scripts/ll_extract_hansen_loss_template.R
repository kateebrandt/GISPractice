## KB
## March 14 2019
## Extract tree cover in buffers surrounding points
## Extract each year of loss by points
library(rgdal)
library(raster)
#library(dplyr)
library(tidyverse)


dat <- data.frame(yo =1:10, lo = 20:29)
# (1) Cross section - 20116-2017 
dataset_name = "MW_16"
hh_geo <- readOGR(dsn = "./data",layer = "mw16_hh_geo_sp_wgs84")
buff = 10000
year = "07"
###########################################################################################
#############################################################################
## (2007-2017)
lossyr <- raster("./data/loss07.tif")
pixcolname <- paste0("loss",year,"_",(buff/1000),"k_nop")
areacolname <-paste0("loss",year,"_",(buff/1000),"k_area")

#Select all cells = 7

calc_pix <- raster::extract(lossyr, hh_geo,
                buffer = buff, fun = sum)
## Convert cell total to area
calc_area <- calc_pix*900

dat<-data.frame(calc_pix,calc_area)
names(dat) <- c(pixcolname,areacolname)
##store data on drive
fname <- paste0(dataset_name,"_",year,"_",buff/1000)
write_rds(x = dat,path=paste0("data/",fname,".rds"))