remotes::install_github("vidrl/VIDRLColor", force=TRUE)
library(VIDRLColor)
library(dplyr)

my_colors <- Get_Color_list("test")

setwd("/Users/admin/Documents/VIDRL/outbreak/measles/CW_report")

df <- read.csv("master_N450_table.csv")

country_list <- df %>% filter(!is.na(Country))%>% pull(Country) %>% unique()

color_list <- add_Colors(country_list, "measles")

save_Colors(color_list)

color_new <- Get_Color_list("measles")


Outbreak_list <- df %>% filter(!is.na(Outbreak)) %>% pull(Outbreak) %>% unique()

color_out <- add_Colors(Outbreak_list, "measles")

save_Colors(color_out)

DSid_list <- df %>% filter(!is.na(DSid)) %>% pull(DSid) %>% unique()
color_ds <- add_Colors(DSid_list, "measles")
save_Colors(color_ds)

colors <- Get_Color_list("measles")
colors

new_ds <- readLines("new_dsid.txt")

color_again <- add_Colors(new_ds, "measles")
save_Colors(color_again)

