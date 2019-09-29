## KB
## March 22
## Bind loss year data together for Long Panel sets


##### LAST EDITED SEPTEMBER 29 2019 -- CHECK WHICH RDS ARE BEING MERGED  ##########

library(dplyr)
library(plyr)
library(rgdal)

## LONG PANEL YEAR 1 - 2010
y07 <- data.frame(readRDS("./data/MW_LPY1_10_07_30.rds"))
y08 <- data.frame(readRDS("./data/MW_LPY1_10_08_30.rds"))
y09 <- data.frame(readRDS("./data/MW_LPY1_10_09_30.rds"))
y10 <- data.frame(readRDS("./data/MW_LPY1_10_10_30.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mwlpy1_hh_geo_sp_wgs84")

mwlpy1_loss <- cbind(hhgeo@data, y07, y08, y09, y10)

write.csv(mwlpy1_loss, "./data/mwlpy1_loss_30k.csv")

## LONG PANEL YEAR 1 - 2010 (50k)
y07 <- data.frame(readRDS("./data/MW_LPY1_07_50.rds"))
y08 <- data.frame(readRDS("./data/MW_LPY1_08_50.rds"))
y09 <- data.frame(readRDS("./data/MW_LPY1_09_50.rds"))
y10 <- data.frame(readRDS("./data/MW_LPY1_10_50.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mwlpy1_hh_geo_sp_wgs84")

mwlpy1_loss <- cbind(hhgeo@data, y07, y08, y09, y10)

write.csv(mwlpy1_loss, "./data/mwlpy1_loss50k.csv")

## LONG PANEL YEAR 2 - 2013
y07 <- data.frame(readRDS("./data/MW_LPY2_13_07_30.rds"))
y08 <- data.frame(readRDS("./data/MW_LPY2_13_08_30.rds"))
y09 <- data.frame(readRDS("./data/MW_LPY2_09_09_30.rds"))
y10 <- data.frame(readRDS("./data/MW_LPY2_10_10_30.rds"))
y11 <- data.frame(readRDS("./data/MW_LPY2_11_11_30.rds"))
y12 <- data.frame(readRDS("./data/MW_LPY2_12_12_30.rds"))
y13 <- data.frame(readRDS("./data/MW_LPY2_13_13_30.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mwlpy2_hh_geo_sp_wgs84")

mwlpy_loss <- cbind(hhgeo@data, y07, y08, y09, y10, y11, y12, y13)

write.csv(mwlpy_loss, "./data/mwlpy2_loss_30k.csv")

## LONG PANEL YEAR 2 - 2013 - 50k
y07 <- data.frame(readRDS("./data/MW_LPY2_07_50.rds"))
y08 <- data.frame(readRDS("./data/MW_LPY2_08_50.rds"))
y09 <- data.frame(readRDS("./data/MW_LPY2_09_50.rds"))
y10 <- data.frame(readRDS("./data/MW_LPY2_10_50.rds"))
y11 <- data.frame(readRDS("./data/MW_LPY2_11_50.rds"))
y12 <- data.frame(readRDS("./data/MW_LPY2_12_50.rds"))
y13 <- data.frame(readRDS("./data/MW_LPY2_13_50.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mwlpy2_hh_geo_sp_wgs84")

mwlpy_loss <- cbind(hhgeo@data, y07, y08, y09, y10, y11, y12, y13)

write.csv(mwlpy_loss, "./data/mwlpy2_loss50k.csv")

## LONG PANEL YEAR 3 - 2016/17
y07 <- data.frame(readRDS("./data/june/MW_LPY3_07_5.rds"))
y08 <- data.frame(readRDS("./data/june/MW_LPY3_08_5.rds"))
y09 <- data.frame(readRDS("./data/june/MW_LPY3_09_5.rds"))
y10 <- data.frame(readRDS("./data/june/MW_LPY3_10_5.rds"))
y11 <- data.frame(readRDS("./data/june/MW_LPY3_11_5.rds"))
y12 <- data.frame(readRDS("./data/june/MW_LPY3_12_5.rds"))
y13 <- data.frame(readRDS("./data/june/MW_LPY3_13_5.rds"))
y14 <- data.frame(readRDS("./data/june/MW_LPY3_14_5.rds"))
y15 <- data.frame(readRDS("./data/june/MW_LPY3_15_5.rds"))
y16 <- data.frame(readRDS("./data/june/MW_LPY3_16_5.rds"))
y17 <- data.frame(readRDS("./data/june/MW_LPY3_17_5.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mwlpy3_hh_geo_sp_wgs84")

mwlpy_loss <- cbind(hhgeo@data, y07, y08, y09, y10, y11, y12, y13, y14, y15, y16, y17)

write.csv(mwlpy_loss, "./data/mwlpy3_loss10k.csv")


## LONG PANEL YEAR 3 - 50k
y07 <- data.frame(readRDS("./data/MW_LPY3_1617_07_30.rds"))
y08 <- data.frame(readRDS("./data/MW_LPY3_1617_08_30.rds"))
y09 <- data.frame(readRDS("./data/MW_LPY3_1617_09_30.rds"))
y10 <- data.frame(readRDS("./data/MW_LPY3_1617_10_30.rds"))
y11 <- data.frame(readRDS("./data/MW_LPY3_1617_11_30.rds"))
y12 <- data.frame(readRDS("./data/MW_LPY3_1617_12_30.rds"))
y13 <- data.frame(readRDS("./data/MW_LPY3_1617_13_30.rds"))
y14 <- data.frame(readRDS("./data/MW_LPY3_1617_14_30.rds"))
y15 <- data.frame(readRDS("./data/MW_LPY3_1617_15_30.rds"))
y16 <- data.frame(readRDS("./data/MW_LPY3_1617_16_30.rds"))
y17 <- data.frame(readRDS("./data/MW_LPY3_1617_17_30.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mwlpy3un_hh_geo_sp_wgs84")
hhgeo_full <- readOGR(dsn = "./data", layer = "mwlpy3_hh_geo_sp_wgs84")
hhgeo_full <- hhgeo_full@data
mwlpy_loss <- cbind(hhgeo_full, y07, y08, y09, y10, y11, y12, y13, y14, y15, y16, y17)
mwlpy3mer <- merge(hhgeo_full, mwlpy_loss, by = c("lat", "lon", "ea_id"))
mwlpy3mer <- mwlpy3mer[,-12]
write.csv(mwlpy_loss, "./data/mwlpy3_loss_30k.csv")


## CROSS SECTION - 2016/17
y07 <- data.frame(readRDS("./data/MW_16_07_10.rds"))
y08 <- data.frame(readRDS("./data/MW_16_08_10.rds"))
y09 <- data.frame(readRDS("./data/MW_16_09_10.rds"))
y10 <- data.frame(readRDS("./data/MW_16_10_10.rds"))
y11 <- data.frame(readRDS("./data/MW_16_11_10.rds"))
y12 <- data.frame(readRDS("./data/MW_16_12_10.rds"))
y13 <- data.frame(readRDS("./data/MW_16_13_10.rds"))
y14 <- data.frame(readRDS("./data/MW_16_14_10.rds"))
y15 <- data.frame(readRDS("./data/MW_16_15_10.rds"))
y16 <- data.frame(readRDS("./data/MW_16_16_10.rds"))
y17 <- data.frame(readRDS("./data/MW_16_17_10.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mw16_hh_geo_sp_wgs84")

mwlpy_loss <- cbind(hhgeo@data, y07, y08, y09, y10, y11, y12, y13, y14, y15, y16, y17)

write.csv(mwlpy_loss, "./data/mw16_loss10k.csv")

## CROSS SECTION - 2016/17
y07 <- data.frame(readRDS("./data/june/1617_07_5.rds"))
y08 <- data.frame(readRDS("./data/june/1617_08_5.rds"))
y09 <- data.frame(readRDS("./data/june/1617_09_5.rds"))
y10 <- data.frame(readRDS("./data/june/1617_10_5.rds"))
y11 <- data.frame(readRDS("./data/june/1617_11_5.rds"))
y12 <- data.frame(readRDS("./data/june/1617_12_5.rds"))
y13 <- data.frame(readRDS("./data/june/1617_13_5.rds"))
y14 <- data.frame(readRDS("./data/june/1617_14_5.rds"))
y15 <- data.frame(readRDS("./data/june/1617_15_5.rds"))
y16 <- data.frame(readRDS("./data/june/1617_16_5.rds"))
y17 <- data.frame(readRDS("./data/june/1617_17_5.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mw16un_hh_geo_sp_wgs84")

mwlpy_loss <- cbind(hhgeo@data, y07, y08, y09, y10, y11, y12, y13, y14, y15, y16, y17)
hhgeo_full <- readOGR(dsn = "./data", layer = "mw16_hh_geo_sp_wgs84")
hhgeo_full <- hhgeo_full@data
#colnames(hhgeo_full)[c(3,4)] <- c("lat", "lon")
mw16mer <- merge(hhgeo_full, mwlpy_loss, by = c("lt_mdfd","ln_mdfd"))

write.csv(mw16mer, "./data/june/mw16_loss_5k.csv")

## CROSS SECTION - 2010
y07 <- data.frame(readRDS("./data/MW_10_07_10.rds"))
y08 <- data.frame(readRDS("./data/MW_10_08_10.rds"))
y09 <- data.frame(readRDS("./data/MW_10_09_10.rds"))
y10 <- data.frame(readRDS("./data/MW_10_10_10.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mw10_hh_geo_sp_wgs84")

mw_loss <- cbind(hhgeo@data, y07, y08, y09, y10)

write.csv(mw_loss, "./data/mw10_loss10k.csv")

## CROSS SECTION - 2010 - 50k
y07 <- data.frame(readRDS("./data/june/MW_10_07_5.rds"))
y08 <- data.frame(readRDS("./data/june/MW_10_08_5.rds"))
y09 <- data.frame(readRDS("./data/june/MW_10_09_5.rds"))
y10 <- data.frame(readRDS("./data/june/MW_10_10_5.rds"))

hhgeo <- readOGR(dsn = "./data", layer = "mw10un_hh_geo_sp_wgs84")
hhgeo <- hhgeo@data
hhgeo_full <- readOGR(dsn = "./data", layer = "mw10_hh_geo_sp_wgs84")
hhgeo_full <- hhgeo_full@data

mw_loss <- cbind(hhgeo, y07, y08, y09, y10)
mw10mer <- merge(hhgeo_full, mw_loss, by = c("lat","lon","ea_id"))

write.csv(mw10mer, "./data/june/mw10_loss_5k.csv")

