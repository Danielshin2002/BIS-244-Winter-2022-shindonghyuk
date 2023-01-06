rm(list=ls(all=TRUE))
cat("\014")

library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)

us_states <- read_csv("E:/2022 Winter Semester/Bis 244/Bis-244-Winter-2022-shin_donghyuk/COVID-19_Project/covid-19-data/us-states.csv")

us_states_PA <- us_states %>% filter(state == "Pennsylvania")

n <- length(us_states_PA$date)

us_states_PA$incr_cases <- 2
us_states_PA$incr_deaths <- 0

for (i in 2:n) {
  us_states_PA$incr_cases[i] <-(us_states_PA$cases[i]-us_states_PA$cases[i-1])
}

for (i in 2:n) {
  us_states_PA$incr_deaths[i] <-(us_states_PA$deaths[i]-us_states_PA$deaths[i-1])
}
view(us_states_PA)
sd(us_states_PA$incr_cases)
