# KB
# February 20 2019
# Merging popden and access to cities variables for 16-17 data

library(dplyr)

# read files to be merged into data frame format

access1617 <- data.frame(readRDS("./data/hhgeo_w_calculated_access.rds"))
popden <- data.frame(readRDS("./data/hhgeo_w_popden10k (1).rds"))

# copy popden10k column to main data frame
hhgeo1617_mw_lsms_mergedvar <- merge(access, popden) 
# write to csv for upload
write.csv(hhgeo1617_mw_lsms_mergedvar, file = "hhgeo1617_mw_lsms.csv", row.names = FALSE)

