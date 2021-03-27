library(readr)
library(dplyr)
library(ggplot2)

# RECRUITMENT: ----

## Data
recruitment <- read_csv("Data/recruitment_data.csv")

## Exploratory Data Analysis
# - summary
recruitment %>% skimr::skim()
recruitment %>% glimpse()
recruitment %>% count(recruiting_source)

## Visual: Average Sales Quota By Recruiting Source
recruitment %>% 
  group_by(recruiting_source) %>% 
  summarise(avg_sales_quota = mean(sales_quota_pct)) %>% 
  ggplot(aes(recruiting_source, avg_sales_quota)) +
  geom_col() + geom_hline(yintercept = 1.08, color = "red") +
  labs(title = "Avg Sales Quota Pct")

## Visual: Average Attrition Rate By Recruiting Source
recruitment %>% 
  group_by(recruiting_source) %>% 
  summarise(attrition_rate = mean(attrition)) %>% 
  arrange(attrition_rate) %>% 
  ggplot(aes(recruiting_source, attrition_rate)) +
  geom_col() + geom_hline(yintercept = 0.213, color = "red") +
  labs(title = "Attrition Rate")


