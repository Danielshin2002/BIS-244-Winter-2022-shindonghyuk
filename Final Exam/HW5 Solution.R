library(tidyverse)
library(gridExtra)
rm(list=ls(all=TRUE))
cat("\014")

WOT <- read.csv("WOT.csv")
WOT$`Win Rate` <- as.numeric(parse_number(WOT$WR))
p <- ggplot(data = WOT[WOT$Battles>3,],
            mapping = aes(x = reorder(Nation, `Win Rate`, median,na.rm=TRUE), y = `Win Rate`))
p1 <- p + geom_boxplot() + labs(x=NULL,y="Win Rate (WR)") +
  coord_flip()



WOT$Survival <- as.numeric(parse_number(WOT$Survival))
p <- ggplot(data = WOT[WOT$Battles>3,],
            mapping = aes(x = reorder(Nation, `Win Rate`, median,na.rm=TRUE), y = Survival))
p2 <- p + geom_boxplot() + labs(x=NULL,y="Survival Rate (Survival)") +
  coord_flip()
grid.arrange(p1,p2,nrow=1)
