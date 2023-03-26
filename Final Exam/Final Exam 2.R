rm(list=ls(all=TRUE))
cat("\014")
##Packages


library(gapminder)
library(socviz)
library(tidyverse)
library(ggrepel)
library(gapminder)
library(here)
library(ggplot2)
library(tidyverse)
library(socviz)
library(readr)
library(dplyr)
library(gridExtra)
library(gridExtra)
library(readr)
library(ggrepel)
library(scales)

Ukrainian_refugees <- read_csv("Ukrainian_refugees.csv")
Ukrainian_refugees <- Ukrainian_refugees %>% mutate(IS_EU = case_when(
                          Country %in% c("Austria", "Belgium", "Bulgaria",
                                         "Croatia", "Cyprus", "Czechia", "Denmark", 
                                         "Estonia", "Finland", "France", "Germany", 
                                         "Greece", "Hungary", "Ireland", "Italy", 
                                         "Latvia", "Lithuania", "Luxembourg", "Malta", 
                                         "Netherlands", "Poland", "Portugal", "Romania",
                                         "Slovakia", "Slovenia", "Spain", "Sweden") ~ "#003399", TRUE ~ "#999999"))

Ukrainian_refugees <- Ukrainian_refugees %>% mutate(IS_EU = case_when(
  Country %in% c("Austria", "Belgium", "Bulgaria",
                 "Croatia", "Cyprus", "Czechia", "Denmark", 
                 "Estonia", "Finland", "France", "Germany", 
                 "Greece", "Hungary", "Ireland", "Italy", 
                 "Latvia", "Lithuania", "Luxembourg", "Malta", 
                 "Netherlands", "Poland", "Portugal", "Romania",
                 "Slovakia", "Slovenia", "Spain", "Sweden") ~ "Yes", TRUE ~ "No"))


Europe_Distinct <- c("#003399", "#999999")
p <- ggplot(Ukrainian_refugees, aes(x = reorder(Country, `Number of Ukrainian Refugees`, na.rm = TRUE), y = `Number of Ukrainian Refugees`))
p + geom_col(width = 0.6) + 
          labs(x = "Country fled to", 
          y = "Number of Ukrainian Refugees",
          caption  = "Latest Date : 11/22/2022",
          title = "Sum of Ukranian Refugees, Feb-Nov 2022",
          subtitle = "by Dong Hyuk Shin as of 1-22-2023") + theme(plot.title = element_text(face = "bold.italic", color = "orange", size = 20))+
  coord_flip() + theme(legend.position = "bottom")  + scale_color_manual(values = Europe_Distinct) +
  geom_text(mapping= aes(label = scales::comma(`Number of Ukrainian Refugees`)), hjust = -0.2, )
  

