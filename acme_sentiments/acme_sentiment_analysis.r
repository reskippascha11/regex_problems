library(tidyverse)

##########################
# Acme customer feedback #
##########################

# Part 1
product_review_tib <- read_tsv("acme_sentiments/customer_product_reviews.tsv",
                               show_col_types = FALSE)
product_review_tib

# Part 2
product_review_tib <- product_review_tib %>% 
  add_column(sentiment = "", .before  = "review")
product_review_tib

# Part 3
# Step 1 - Given
positive_word_regex_pattern <- 
  "\\b(good|great|happy|super|like|nic.*)\\b"
positive_word_regex_pattern

# Step 2
negative_word_regex_pattern <- 
  "\\b(bad|terrible|stinks|awful|cheap|dis.*)\\b"
negative_word_regex_pattern

# Part 4
for (i in 1:nrow(product_review_tib)) {
  
  review <- product_review_tib$review[[i]]
  
  if (str_detect(review, negative_word_regex_pattern)){
    sentiment <- "negative"
  } else if (str_detect(review, positive_word_regex_pattern)) {
    sentiment <- "positive"
  } else {
    sentiment <- "unknown"
  }   
  
  product_review_tib$sentiment[[i]] <- sentiment   
}
product_review_tib

# Part 5
readr::write_tsv(product_review_tib, "acme_sentiments/customer_sentiments.tsv")

