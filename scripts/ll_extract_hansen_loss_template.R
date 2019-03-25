## KB
## March 24 2019
## Extract tree cover in buffers surrounding points
## Extract each year of loss by points
library(rgdal)
library(raster)
#library(dplyr)
library(tidyverse)

## JOB 42 - 2015 loss, 50k buffer, LPY3  data
# (1) LONG PANEL YEAR 3
dataset_name = "MW_LPY3"
hh_geo <- readOGR(dsn = "./data",layer = "mwlpy3un_hh_geo_sp_wgs84")
buff = 50000
year = "07"
###########################################################################################
#############################################################################
## (2007-2017)
lossyr <- raster("./data/loss07.tif")
pixcolname <- paste0("loss",year,"_",(buff/1000),"k_nop")
areacolname <-paste0("loss",year,"_",(buff/1000),"k_area")

#Select all cells
start_time <- Sys.time()
calc_pix <- raster::extract(lossyr, hh_geo,
                buffer = buff, fun = sum)
end_time <- Sys.time()
time_taken <- end_time - start_time
time_taken
## Convert cell total to area
calc_area <- calc_pix*900

dat<-data.frame(calc_pix,calc_area)
names(dat) <- c(pixcolname,areacolname)
##store data on drive
fname <- paste0(dataset_name,"_",year,"_",buff/1000)
write_rds(x = dat,path=paste0("data/",fname,".rds"))
