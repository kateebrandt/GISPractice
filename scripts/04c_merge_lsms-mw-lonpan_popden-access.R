# KB
# February 20 2019
# Merging popden and access to cities variables for long panel data

library(dplyr)
library(base)
library(plyr)

## YEAR 1 - 2010 Geovar merge

# read files to be merged into data frame format
access <- data.frame(readRDS("./data/hhgeolpy1_w_calculated_access.rds"))
popden <- data.frame(readRDS("./data/hhgeolpy1_w_popden10k.rds"))

# copy popden10k column to main data frame
hhgeolpy1 <- left_join(access, popden, by = "case_id") 
# remove repeated columns
hhgeolpy1 <- hhgeolpy1[, c(1:7,12)]
# write to csv for upload
write.csv(hhgeolpy1, file = "hhgeolpy1_mw_lsms.csv", row.names = FALSE)

#############################################################################
## YEAR 2 - 2013 Geovar merge

# read files to be merged into data frame format
access <- data.frame(readRDS("./data/hhgeolpy2_w_calculated_access.rds"))
popden <- data.frame(readRDS("./data/hhgeolpy2_w_popden10k_10_13_15.rds"))
# subset needed columns for merge
access <- access[,c(1,9)]

# copy popden10k column to main data frame
hhgeolpy2 <- left_join(access, popden, by = "y2_hhid") 
hhgeolpy2 <- hhgeolpy2[,-c(13:15)]
# write to csv for upload
write.csv(hhgeolpy2, file = "hhgeolpy2_mw_lsms.csv", row.names = FALSE)


#############################################################################
## YEAR 3 - 2016-17 Geovar merge

# read files to be merged into data frame format
access <- data.frame(readRDS("./data/hhgeolpy3_w_calculated_access.rds"))
popden <- data.frame(readRDS("./data/hhgeolpy3_w_popden10k_15.rds"))
# subset needed columns for merge
access <- access[,c(1,12)]

# copy popden10k column to main data frame
hhgeolpy3 <- right_join(access, popden, by = "y3_hhid") 
# remove repeated columns
hhgeolpy3 <- hhgeolpy3[, -c(14:16)]
# write to csv for upload
write.csv(hhgeolpy3, file = "hhgeolpy3_mw_lsms.csv", row.names = FALSE)
