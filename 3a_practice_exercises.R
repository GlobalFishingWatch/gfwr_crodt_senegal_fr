# pour charger les packages
library(gfwr)
library(tidyr)
library(dplyr)

# Practice exercises for Session 4 (gfw_vessel_info) of gfwr training in Senegal

# Exercise 1. Get all Senegal-flagged fishing vessels from January 1 to June 30, 2024
# How many vessels are there? What is the dominant geartype?

# 1.1. There is no shiptype filter in gfw_vessel_info so pull all SEN-flagged vessels during the time-period.
# We want to include vessels broadcasting on AIS during the period Jan 1 to June 30, 2024

sen_vessels <- gfw_vessel_info(where = "flag = 'SEN' AND transmissionDateFrom <= '2024-06-30' AND transmissionDateTo >= '2024-01-01'", search_type = "search", print_request = TRUE)

# Next, let's filter for vessels with shiptype = 'FISHING'
# shiptype is in the table 'combinedVesselInfo'
# first, investigate what values are in the shiptype_name

sen_vessels$combinedSourcesInfo %>%
  group_by(shiptypes_name) %>%
  summarize(vessels = length(unique(index))) %>%
  arrange(desc(vessels))


sen_fishing_ids <- sen_vessels$combinedSourcesInfo %>% filter(shiptypes_name)

sen_vessels$combinedSourcesInfo %>% group_by(shiptypes_name) %>% summarize(vessels = length(unique(index))) %>% arrange(desc(vessels))
