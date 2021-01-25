library(tidyverse)
source("preprocessing/doc_extract.R")

sermons_en = doc_extract("../pols559_final_data/official_eng/", location = FALSE) 



sermons_translated <- 
  read_csv("preprocessing/sermons_translated.csv") %>%
  filter(date >= "2016-02-05")
  

sermons_appendix = 
  sermons_en %>% 
  mutate(original = content, .keep = "unused") %>%
  left_join(sermons_translated, by = "date") %>%
  drop_na()


write_csv(sermons_appendix, "appendix/appendix.csv")