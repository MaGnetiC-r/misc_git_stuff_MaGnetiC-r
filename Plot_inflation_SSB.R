library(tidyverse)
library(ggplot2)
library(readxl)


data <- read_excel("Data1.xlsx", skip = 2) |> 
  as_tibble() |> 
  select(-`...1`) |> 
  rename(tid = `...2`) |> 
  mutate(tid = gsub("M", "-", tid)) |> 
  mutate(tid = ym(tid))

names(data) <- c("time", "KPI(2015=100)", "Monthly_cange(percent)", "month12_change_percent",
                 "KPI(Weights)")

data |> ggplot(aes(x = time, y = month12_change_percent)) + 
  geom_line(color = "green") +
  geom_point() +
  scale_x_date(
    date_breaks = "6 months",
    date_labels = "%Y-%m"
  ) +
  theme_dark()
  


