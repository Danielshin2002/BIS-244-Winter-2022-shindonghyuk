# api: Student performance in California schools

# The Academic Performance Index is computed for all California  schools based on standardised testing of students. The data sets  contain information for all schools with at least 100 students and  for various probability samples of the data. Please see the following website for the columns definitions:
  # https://www.rdocumentation.org/packages/survey/versions/4.1-1/topics/api 

## Details

# "apipop" is the entire population, 
# "apisrs" is a simple random sample, 
# "apiclus1" is a cluster sample of school districts, 
# "apistrat" is a sample stratified by stype, and 
# "apiclus2" is a two-stage cluster sample of schools within districts. 
# The sampling weights in apiclus1 are incorrect (the weight should be 757/15) but are as obtained from UCLA.

# Assignment 4
# To use the "apipop" dataframe please run the following syntaxes. The dataframe for all parts is "apipop".
# ========================================================================
library(tidyverse)
library(survey)
data(api)

# ========================================================================

## Part a) 
# create a bar plot to show the number of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================

str(apipop)

p <- ggplot(data = apipop,
            mapping = aes(x = stype))
p + geom_bar()
# ========================================================================

## Part b) 
# create a bar plot to show the percentage of schools in each school type (Elementary/Middle/High School) in California. 
# ========================================================================


p <- ggplot(data = apipop,
            mapping = aes(x = stype))
p + geom_bar(mapping = aes(y = ..prop..,group = 1))

# ========================================================================

## Part c) 
# create a bar plot to show the number of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  
# ========================================================================


p <- ggplot(data = apipop,
            mapping = aes(x = stype, 
                          fill = awards))
p + geom_bar(position = "dodge",
             mapping = aes(y = ..prop.., 
                           group = awards)) 

# ========================================================================

## Part d) 
# create a bar plot to show the percentage of schools that are "Eligible for awards program" or not in each school type (Elementary/Middle/High School).  

# ========================================================================

p2 <- ggplot(data = apipop,
             mapping = aes(x = stype))

p2 + geom_bar(position = "dodge",
              mapping = aes(y = ..prop.., 
                            group = 1, group = awards)) +
  facet_wrap(~awards, nrow =1)



# ========================================================================

## Part e) 
# use facet to create two histogram to show the distributions of the "number of students enrolled" in all school whether are "Eligible for awards program" or not (bins=30).
# ========================================================================

                   
p3 <- ggplot(data = apipop,
             mapping= aes(x = enroll))
p3 + geom_histogram(bin = 30) + facet_wrap(~awards, nrow =1)


# ========================================================================
