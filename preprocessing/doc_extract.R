doc_extract = function(file, location=FALSE){
  
  require(textreadr)
  require(tidyverse)

  data_df <- 
    read_dir(file, combine=TRUE, ocr = TRUE, doc.col = "title") %>% 
    as_tibble()
  
  data_df <- 
    data_df %>% 
    mutate(date = str_extract(content, "\\d{2}.\\d{2}.\\d{4}") %>% 
             parse_date("%d%.%m%.%Y")) %>% 
    select(date, title, content) 

  date_nas <- 
    data_df %>% 
    filter(date %>% is.na()) %>% 
    mutate(date = str_extract(title, "\\d{2}.\\d{2}.\\d{4}") %>% 
             readr::parse_date("%d%.%m%.%Y")) 
  
  data_df <- 
    data_df %>% 
    filter(is.finite(date)) %>% 
    bind_rows(date_nas) %>% 
    arrange(desc(date))
  
  if(location){
    data_df <- 
      data_df %>%
      mutate(location = str_extract(content, "ANKARA|GENEL|((?i)[Iİiı]stanbul)|DİYANET|Diyanet"),
           .after = date) 
    }
  
  return(data_df)
}

