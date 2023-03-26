rm(list=ls(all=TRUE))
cat("\014")

library(gapminder)
library(here)
library(tidyverse)
library(socviz)
library(readr)
install.packages("gridExtra")
library(gridExtra)
library(readr)

AMD <- read_csv("E:/2022 Winter Semester/Bis 244/BIS-244-Winter-2022/Exam 1/AMD.csv")
p1 <- ggplot(data = AMD , mapping = aes(x= Date, y = High))
p1 + geom_jitter(data = AMD, mapping = aes(x = Date, y = High, color = log(Volume)))+ 
  labs(x = "Date", y = "AMD Highest Prices",
       title = "Highest Price from 2/24/2021 to 2/24/2022",
       subtitle = "By DongHyuk Shin as of 1-9-2023",
       caption = "Source : AMD",
       color = "log(Volume)") 


