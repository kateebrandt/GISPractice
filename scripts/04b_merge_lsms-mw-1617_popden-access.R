# KB
# February 20 2019
# Merging popden and access to cities variables for 16-17 data

library(dplyr)

# read files to be merged into data frame format

access <- data.frame(readRDS("./data/hhgeo_w_calculated_access.rds"))
popden <- data.frame(readRDS("./data/hhgeo_w_popden10k (1).rds"))

# copy popden10k column to main data frame
hhgeo1617_mw_lsms_mergedvar <- merge(access, popden) 
# remove unwanted columns
hhgeo1617_mw_lsms_mergedvar <- hhgeo1617_mw_lsms_mergedvar[, -c(5,6,7)]
# write to csv for upload
write.csv(hhgeo1617_mw_lsms_mergedvar, file = "hhgeo1617_mw_lsms.csv", row.names = FALSE)

