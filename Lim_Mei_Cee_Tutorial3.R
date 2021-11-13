install.packages('selectr')
install.packages('xml2')
install.packages('rvest')
install.packages('stringr')
install.packages(jsonlite)
#loading the package:> library(xml2)> library(rvest)> library(stringr)
library(xml2)
library(rvest)
library(stringr)
Amazonwebpage <- read_html("https://www.amazon.in/CERTIFIED-REFURBISHED-OnePlus-Mirror-Storage/dp/B07JDZL7ZN/ref=dp_prsubs_2?pd_rd_i=B07JDZL7ZN&th=1")
#get the product title
title_html <- html_nodes(Amazonwebpage, 'h1#title')
title <- html_text(title_html) 
head(title)
#remove all space and new lines
str_replace_all(title, "[\r\n]", "")

#price of the product
price_html <- html_nodes(Amazonwebpage,'span#priceblock_ourprice')
price <- html_text(price_html)
price <- str_replace_all(price, "[\r\n]", "")
head(price)

#product description
desc_html <- html_nodes(Amazonwebpage, 'div#renewedProgramDescriptionAtf')
desc <- html_text(desc_html)
desc <- str_replace_all(desc, "[\r\n\t]", "")
desc <- str_trim(desc)
head(desc)

#rating of the product
rate_html <- html_nodes(Amazonwebpage, 'span#acrPopover')
rate <- html_text(rate_html)
rate <- str_replace_all(rate, "[\r\n]", "")
rate <- str_trim(rate)
head(rate)


#combining all the lists to form a data frame 
product_data <- data.frame(Title = title, Price = price, Description = desc, Rating = rate)
str(product_data)

