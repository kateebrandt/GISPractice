## KB
## March 22 
## Code from VG to use ncdf files

library(raster)
library(ncdf4) ## if you want to use but not necessary
library(R.utils) ## Needed for unzipping ncdf files (if they end in gz they are zipped- most likely case)

fname <-"C:/Users/kbran/OneDrive/Documents/GISPractice/data/climate/cru_ts4.01.2011.2016.tmp.dat.nc" # your file path
#nc_path <- gunzip(fname) ## will unzip the file
#r <- raster(nc_path) # this will ONLY read the first file , so store as a raster STACK which helps store multiple raster #files, and you can use your normal functions such as extract , resample etc on the WHOLE STACK AT ONE
r <- stack(fname) # read all rasters together
print(r[[1]]) ## check metadata
res <- ncdf4::nc_open(nc_path) ## will store all files as netcdf if you are into that sort of stuff....
