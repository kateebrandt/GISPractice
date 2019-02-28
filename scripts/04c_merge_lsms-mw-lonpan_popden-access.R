# KB
# February 20 2019
# Merging popden and access to cities variables for long panel data

library(dplyr)
library(base)
library(plyr)
# read files to be merged into data frame format

accesslp <- data.frame(readRDS("./data/hhgeolonpan_w_calculated_access.rds"))
popden <- data.frame(readRDS("./data/hhgeolonpan_w_popden10k_comp.rds"))

# copy popden10k column to main data frame
hhgeolp_mw_lsms_mergedvar <- left_join(access, popden, by = "case_id") 
# remove repeated columns
hhgeolp_mw_lsms <- hhgeolp_mw_lsms_mergedvar[, -c(6,7,8,9,10,11)]
# write to csv for upload
write.csv(hhgeolp_mw_lsms, file = "hhgeolonpan_mw_lsms.csv", row.names = FALSE)
