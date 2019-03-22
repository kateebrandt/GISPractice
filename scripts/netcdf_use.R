library(ncdf4)
library(raster)
library(rgdal)
library(utils)
install.packages("R.utils")
library(R.utils)
a <- gunzip("./data/climate/cru_ts4.01.2011.2016.tmp.dat.nc.gz")

a <- raster("./data/climate/cru_ts4.01.2011.2016.tmp.dat.nc")
plot(a)

a <- nc_open("./data/climate/tempAnom_1971_2016_subAfrica.nc")
b <- nc_open("./data/climate/cru_ts4.01.2011.2016.tmp.dat.nc")

plot(a)


