library(tidyverse)


gapminder_1997 <- read_csv("gapminder_1997.csv")
str(gapminder_1997)

sum(5,6)
round(3.1415,3)
round(3,3,1415)
round(x = 3.14159, digits = 2)

ggplot(data = gapminder_1997) + 
  aes(x = gdpPercap) +
  labs(x = "GDP per Capita") +
  aes(y = lifeExp)  +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title = "Do people in wealthy countries live longer?") +
  aes(color = continent) + 
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) + 
  labs(size = "Population in Millions") +
  labs(color = "Continent")
  
ggplot(data = gapminder_1997) + 
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000) +
  geom_point() + 
  scale_color_brewer(palette = "Set1") +
  labs(x = "GDP per Capita", y = "Life Expectancy",
       title = "Do People in Wealthy Countries Live Longer?",
       size = "Population (in millions)")

# Load in a larger dataset

gapminder_data <- read.csv("gapminder_data.csv")

dim(gapminder_data)

ggplot(data = gapminder_data) + 
  aes(x = year, y = lifeExp, group = country, color = continent) + 
  geom_line()  

#Discrete plots 

ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_boxplot()
  
ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_violin() +
  geom_point()

ggplot(data = gapminder_1997) +
  aes(x = continent, y = lifeExp) +
  geom_jitter() + 
  geom_violin() 

# Master Aesthetics
ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin() + 
  geom_jitter(aes(size = pop, color = "pink")) 

ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin(fill = "pink")

ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin(aes(fill = continent))

ggplot(data = gapminder_1997, aes(x = continent, y = lifeExp)) +
  geom_violin(fill = "springgreen")

#Univariate plots

ggplot(gapminder_1997) + 
  aes(x = lifeExp) +
  geom_histogram(bins = 15)

#Plot themes 
ggplot(gapminder_1997) + 
  aes(x = lifeExp) + 
  geom_histogram(bins = 20) + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

#Facet wrap 

ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) + 
  geom_point() + 
  facet_wrap(vars(continent))

# Facet grid
awesome_plot <- ggplot(gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp) + 
  geom_point() + 
  facet_grid(row = vars(continent))

ggsave(awesome_plot, file = "awesome_plot.jpg", width = 6, height = 4)

# Exercise:
# violin plot of continent and life expectancy
# color mapped to continent 
# assigned to an object called violin plot 
# black and white theme 
# save it as "awesome_violin_plot.jpg"

violin_plot <- ggplot(gapminder_1997) +
  aes(x = continent, y = lifeExp, color = continent) + 
  geom_violin() + 
  theme_bw()

violin_plot

ggsave(violin_plot, file = "violin_plot.jpg", width = 6, height = 4)
