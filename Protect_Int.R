install.packages ("tidyverse")

library(tidyverse)

diamonds 

ggplot(data = diamonds) + geom_histogram(mapping = aes(x = price), binwidth = 30)

ggplot(data = diamonds) + geom_bar(mapping = aes(x = price))


#Count by carat

diamonds %>% filter(carat == .99)

diamonds %>% 
  filter(carat == .99) %>% 
  count(cut)


Dimon1 <- count(diamonds %>% filter(carat == 1),"carat")

Dimon99 <- count(diamonds %>% filter(carat == .99),"carat")

Dimon1
Dimon99

diamonds %>% 
  filter(carat == .99) %>% 
  count(cut)

diamonds %>% 
  filter(carat == 1) %>% 
  count(cut)


#grafics

Conf1x2 = matrix(c(1:2), nrow=1, byrow=FALSE)
Conf1x2
layout(Conf1x2)
layout.show(2)

barplot(filter(diamonds,carat == .99)$price, 
        main = "Grafica Diamonds = .99",
        ylab = paste("Diamonds "," count(",toString(Dimon99$n),")"), 
        xlab = "Price",
        horiz = TRUE)


barplot(filter(diamonds,carat == 1)$price, 
        main = "Grafica Diamonds = 1",
        ylab = paste("Diamonds "," count(",toString(Dimon1$n),")"),
        xlab = "Price",
        horiz = TRUE)


install.packages("hexbin")

ggplot(data = diamonds) +
  geom_hex(mapping = aes(x = carat, y = price))


#parte 3

install.packages("ggstance")
install.packages("patchwork")
install.packages("PerformanceAnalytics")

library("ggstance")
library("patchwork")
library("PerformanceAnalytics")


#Matris de correlacion
pairs(~ diamonds$price + diamonds$carat + diamonds$cut , data=diamonds)


#diferencia de dos graficas
g2 <- ggplot(mpg, aes(class, hwy, fill = factor(cyl))) +
  geom_boxplot() +
  coord_flip()

g3 <- ggplot(mpg, aes(hwy, class, fill = factor(cyl))) +
  geom_boxploth()


g2 | g3


