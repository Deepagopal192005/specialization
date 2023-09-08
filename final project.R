#importing libraries
library(rvest)
library(dplyr)
library(robotstxt)
library(stringr)
# scrapping websites
link = "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc"
# Allowability
path=paths_allowed(link)
#html elements from websites
page = read_html(link)
# segregating names
name = page %>% html_nodes(".lister-item-header a") %>% html_text()
#view name
View(name)
# segregating year
year = page %>% html_nodes(".text-muted.unbold") %>% html_text()
#view year
View(year)
## segregating rating
rating = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
#view rating
View(rating)
# segregating synopsis
synopsis = page %>% html_nodes(".ratings-bar+ .text-muted") %>% html_text()
#view synopsis
View(synopsis)
#creating dataframe
movies = data.frame(name, year, rating, synopsis, stringsAsFactors = FALSE)
View(movies)
#exporting dataframe
write.csv(movies, "movies.csv")