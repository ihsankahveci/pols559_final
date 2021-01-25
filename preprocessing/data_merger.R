library(tidyverse)
source("preprocessing/doc_extract.R")

diyanet_df <- 
  read_csv("preprocessing/diyanet_online.csv") %>% 
  mutate(location = "GENEL", .after=date)

ankara_df <- doc_extract("../pols559_final_data/doc_files/", location = TRUE)

istanbul_df <- doc_extract("../pols559_final_data/hutbeler 2001-2012(m.habib)/DATA/", location = TRUE)
istanbul_df$location[is.na(istanbul_df$location)] = "İSTANBUL"

pre2006 <- 
  doc_extract("../pols559_final_data/hutbeler 2001-2012(m.habib)/pre2006-haziran/", location = FALSE) %>% 
  mutate(location = "GENEL", .after=date)  


final_raw <- 
  bind_rows(diyanet_df, ankara_df, istanbul_df, pre2006) %>% 
  arrange(desc(date)) %>%
  mutate(location = as_factor(location)) %>% 
  mutate(location = location %>% 
           fct_collapse(turkey   = c("GENEL", "DİYANET", "Diyanet"),
                        istanbul = c("İSTANBUL", "İstanbul"),
                        ankara   = c("ANKARA")))

write_csv(final_raw, "./preprocessing/sermons_raw.csv")

