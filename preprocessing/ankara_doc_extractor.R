
library(tidyverse)
library(textreadr)


ankara_df = read_dir("/Users/ihsankahveci/Desktop/Friday Sermons/Ankara/doc_files", 
                     combine=T, doc.col = "title") %>% as_tibble()

ankara_df <- ankara_df %>% 
  mutate(date = str_extract(content, "\\d{2}.\\d{2}.\\d{4}") %>% readr::parse_date("%d%.%m%.%Y")) %>% 
  select(date, title, content) 

date_nas <- ankara_df %>% filter(date %>% is.na()) %>% 
  mutate(date = str_extract(title, "\\d{2}.\\d{2}.\\d{4}") %>% readr::parse_date("%d%.%m%.%Y")) 

ankara_df <- ankara_df %>% filter(is.finite(date)) %>% bind_rows(date_nas) %>% arrange(desc(date))

 







