# KB
# February 20 2019
# Merging popden and access to cities variables for 16-17 data

library(dplyr)
library(base)
library(plyr)
# read files to be merged into data frame format

access <- data.frame(readRDS("./data/hhgeo10_w_calculated_access.rds"))
popden <- data.frame(readRDS("./data/hhgeo10_w_popden10k.rds"))

# copy popden10k column to main data frame
hhgeo10_mw_lsms_mergedvar <- left_join(access, popden, by = "case_id") 
# remove repeated columns
hhgeo10_mw_lsms <- hhgeo10_mw_lsms_mergedvar[, -c(6,7,8,9,10,11,13,14,15)]
# write to csv for upload
write.csv(hhgeo10_mw_lsms, file = "hhgeo10_mw_lsms.csv", row.names = FALSE)
