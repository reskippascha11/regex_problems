####################
# Upper Case Words #
####################

# Adding this comment line as the only change to the project

library(tidyverse)

# Part 1
get_uc_words <- function(post) {
  str_extract_all(post, "\\b[A-Z]{2,}\\b") %>% unlist()
}

# Part 2
posts_from_file_tib <- read_csv("upper_case_words/social_media_posts.csv", show_col_types = FALSE)
posts_from_file_tib

# Part 3
uc_words_lst <- lapply(posts_from_file_tib$post, get_uc_words)
uc_words_tib <- tibble(uc_words = uc_words_lst %>% unlist())
uc_words_tib

# Part 4
readr::write_csv(uc_words_tib, "upper_case_words/upper_case_posts.csv", col_names = FALSE)
