## KB
## March 6 2019
## Clarifying data - 

library(foreign)
library(haven)
# Cross sectional data are raw files from LSMS
mw_lsms_cs_2010 <- read.csv("./data/householdgeovariablesIHS3.csv")
mw_lsms_cs_1617 <- read.csv("./data/HouseholdGeovariablesIHS4.csv")

# Panel data have been processed by Yu to link to each other. Uploaded to VG KB Teams drive March 6
mw_lsms_pan10_y1 <- read.csv("./data/2010y1panel.csv")
mw_lsms_pan13_y2 <- read.csv("./data/2013y2panel.csv")
mw_lsms_pan16_y3 <- read_dta("./data/2016y3panel.dta")

