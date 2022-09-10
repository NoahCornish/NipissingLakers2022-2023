library(jsonlite)
library(tidyverse)
library(janitor)
library(dplyr)
library(ggplot2)
library(googlesheets4)
library(stringr)
library(rvest)
library(XML)
library(RCurl)
library(rjson)
library(png)

date <- Sys.Date()


womens_soccer_players_url <- getURL("https://ouastats.prestosports.com/sports/wsoc/2022-23/players?sort=p&view=&pos=kickers&r=0")
womens_soccer_players <- readHTMLTable(womens_soccer_players_url)
womens_soccer_players <- as.data.frame(womens_soccer_players$"NULL")
womens_soccer_players = womens_soccer_players[-1,]
womens_soccer_players <- womens_soccer_players %>% 
  rename(University = `&nbsp`) %>% 
  select(Name, University, gp, gs, g, a, pts,
         sh, `sh%`, sog, `sog%`, yc, pk, gw)


womens_soccer_goalie_url <- getURL("https://ouastats.prestosports.com/sports/wsoc/2022-23/players?sort=svpt&view=&pos=goalie&r=0")
womens_soccer_goalie <- readHTMLTable(womens_soccer_goalie_url)
womens_soccer_goalie <- as.data.frame(womens_soccer_goalie$"NULL")
womens_soccer_goalie = womens_soccer_goalie[-1,]
