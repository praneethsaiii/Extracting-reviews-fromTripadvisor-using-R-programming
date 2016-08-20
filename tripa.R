library(rvest)

url <- "https://www.tripadvisor.in/Restaurant_Review-g60763-d878353-Reviews-or10-McDonald_s-New_York_City_New_York.html#REVIEWS"

reviews <- url %>%
  read_html() %>%
  html_nodes("#REVIEWS .innerBubble")

id <- reviews %>%
  html_node(".quote a") %>%
  html_attr("id")

quote <- reviews %>%
  html_node(".quote span") %>%
  html_text()

#rating <- reviews %>%
 #html_node(".rating .rating_s_fill") %>%
  #html_attr("alt") %>%
  #gsub(" of 5 stars", "", .) %>%
  #as.integer()

#date <- reviews %>%
 # html_node(".rating .ratingDate") %>%
  #html_attr("title") %>%
  #strptime("%b %d, %Y") %>%
  #as.POSIXct()

review <- reviews %>%
  html_node(".entry .partial_entry") %>%
  html_text()

data.frame(id, quote, review, stringsAsFactors = FALSE) %>% View()

