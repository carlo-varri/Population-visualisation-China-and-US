#adding my previously written code
library(readr)
library(tidyverse)
data <- read_csv('Desktop/Learning Python/testing_2/countries.csv')
data
us <- data %>% filter(country == 'United States')
us
china <- data %>% filter(country == 'China')
china
ggplot(us, aes(x = year, y = us$population)) +
  geom_line() 

ggplot(china, aes(x = year, y = population)) +
  geom_line() +  scale_y_continuous(labels = function(l) {
    trans = l / 10*6
  })

ggplot() +
  geom_line(data = us, aes(year, population)) +
  geom_line(data = china, aes(year, population), 
            colour  = 'orange') + 
  scale_y_continuous(labels = function(l) {
    trans = l / 1000000
  }) + 
  labs(y ="Population (millions)")


#now attempting to normalise the populations

us_pc <-us %>% 
  mutate(pc_change = population / population[1] * 100) %>% 
  select (- population)
us_pc

china_pc <- china %>% 
  mutate(pc_change = population / population[1] * 100) %>% 
  select (- population)
china_pc

ggplot() +
  geom_line(data = us_pc, aes(year, pc_change)) +
  geom_line(data = china_pc, aes(year, pc_change), 
            colour  = 'orange') +  
  labs(y ="Population growth (1952 = 100)")

#making some changes 
print('changes')

