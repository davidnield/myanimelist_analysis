require(pacman)

p_load(tidyverse, lubridate)

theme_ed <- theme(
  legend.position = "bottom",
  panel.background = element_rect(fill = NA),
  # panel.border = element_rect(fill = NA, color = "grey75"),
  axis.ticks = element_line(color = "grey95", size = 0.3),
  panel.grid.major = element_line(color = "grey95", size = 0.3),
  panel.grid.minor = element_line(color = "grey95", size = 0.3),
  legend.key = element_blank())

mal <- lst(
  anime = read_csv("Data/anime_cleaned.csv"),
  lists = read_csv("Data/animelists_cleaned.csv"),
  users = read_csv("Data/users_cleaned.csv")
)

mal$lists %>% 
  ggplot(aes(x = my_score)) +
  geom_density()

unique(mal$lists)

mal$users %>% 
  ggplot(aes(x = gender)) +
  geom_bar()

mal$users %>% 
  group_by(gender) %>% 
  count()

mal$users <- mal$users %>% 
  mutate(age = floor(decimal_date(today()) - decimal_date(ymd(birth_date))),
         age_cat = )

mal$users %>% 
  ggplot(aes(x = age, fill = gender)) +
  geom_bar() +
  scale_x_continuous(breaks = c(1:50)) +
  theme_ed +
  facet_wrap(~gender)