library(tidyverse)

#adding covariates from different datasets
holy_dates = load(file = "preprocessing/holy_dates.RData")
rates = read_csv("../pols559_final/preprocessing/rates_grouped.csv")
conflict = read_csv("preprocessing/conflict_grouped.csv")
sermons_translated = read_csv("../pols559_final/preprocessing/sermons_translated.csv")


sermons <- 
  sermons_translated %>% 
  left_join(rates, by="date") %>% 
  left_join(conflict, by="date") %>%
  mutate( 
    ramadan = ifelse(date %within% ramadan_dates,1,0),
    sacrifice = ifelse(date %within% sacrifice_dates,1,0)) %>%
  replace(is.na(.), 0)

sermons %>% write_csv("sermons_final.csv")

# MANUALLY REMOVE THE DUPLICATE AT 2007-10-12 ISTANBUL 
