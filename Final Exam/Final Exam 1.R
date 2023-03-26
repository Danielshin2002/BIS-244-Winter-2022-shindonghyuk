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

World_of_Tanks <- read_csv("World of Tanks.csv")

World_of_Tanks$`Win Rate` <- as.numeric(parse_number(World_of_Tanks$`Win Rate`))

p <- ggplot(data = World_of_Tanks, mapping = (aes (x = Battles, y = `Win Rate`)))
p + geom_point(mapping = aes(color = Type)) +labs(x = "Number of Battles", 
         y = "Win Rate",
         title = "Win Rate vs Battles-Frequencies Played Tanks",
         caption = "Creator : Dong Hyuk Shin (Medhi Davoodi)") + 
  geom_smooth(aes(line = Type, color = Type), method = "lm", se = FALSE)

