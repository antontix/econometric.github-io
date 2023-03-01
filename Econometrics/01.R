library(tidyverse)

#1.знайти 10 людей віком нижче 18 років в періоді 1999-2000 рр. які мали 3 перевірки та є громадянами країни 

read_csv('Arrests.csv')#завантажуємо та зчитуємо файл

glimpse(Arrests)#робимо зріз і переглядаємо структуру

arrests_filtered <- Arrests %>% 
  filter(age < 18,
         year == 1999 | year == 2000,
         checks == 3,
         citizen == 'Yes')#фільтруємо дані під нашу умову

 arrests_filtered  %>% 
  select(age, year, checks, citizen, sex ) %>% #обираємо тільки потрібні стовпці
  slice_tail(n = 10) %>%#зменьшуємо кількість спостережень згідно умові
  arrange(year)  #впорядковуємо роки для зручності дослідження за допомогою arrange



#2.середній вік жінок з темним кольором шкіри,які не були звільнені
  
read_csv('Arrests.csv')#завантажуємо та зчитуємо файл

arrests_filt <- Arrests %>%   
  filter(sex == 'Female',
         colour == 'Black',
         released == 'No')#далі фільтруємо згідно нашої "умови"
arrests_filt %>% 
  select(age, sex, colour, released) %>% #через select обираємо потрібні стовбці
  group_by(sex, colour, released) %>% 
  summarise(ageavg = mean(age))#розраховуємо середне значення віку жінок поперендньо згрупував дані
