rm(list=ls(all=TRUE))
cat("\014")

library(gapminder)
library(here)
library(tidyverse)
library(socviz)
library(readr)
install.packages("gridExtra")
library(gridExtra)


Covid <- read_csv("E:/2022 Winter Semester/Bis 244/BIS-244-Winter-2022/Exam 1/Covid.csv")

EU_Covid <- filter(Covid, countriesAndTerritories %in% c("France","Germany","Greece","Italy","Netherlands","Spain"))

p1<- ggplot(data = EU_Covid,
            mapping = aes(x= countriesAndTerritories, y = cases))
p1 + geom_line(data = EU_Covid, mapping = aes(x = dateRep, y = cases, color = countriesAndTerritories))+ 
            labs(x = "Date", y = "new cases per day",
              fill = "countriesAndTerritories",
              title = "European Covid-19 Case Counts",
              subtitle = "By DongHyuk Shin as of 1-9-2023",
              caption = "Data ECDC Times") + facet_wrap(~countriesAndTerritories) + theme(legend.position = "none")




