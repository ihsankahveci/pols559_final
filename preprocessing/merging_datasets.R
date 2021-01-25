library(readr)
library(dplyr)


ankara_df <- read_csv("/Users/ihsankahveci/Desktop/Friday Sermons/Ankara/ankara_online.csv")
online_df <- read_csv("/Users/ihsankahveci/Desktop/Friday Sermons/pols559_final_data/doc_files/")

sermons_df <- bind_rows(ankara_df, online_df) %>% select(-title) %>% arrange(date) %>% 
  write_csv("sermons.csv")