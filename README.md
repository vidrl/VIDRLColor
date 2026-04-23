# Colors Control for VIDRL plotting

## Instruction

```
remotes::install_github("vidrl/VIDRLColor", force=TRUE)
library(VIDRLColor)

#get named list for colors
colors <- Get_Color_list("measles")

#add new values that need to have a new color
new_values <- c("Country1", "Country2", "Country3")
color_new_list <- add_Colors(new_values, "measles") ## you also can add to new section other than measles for yourself

save_Colors(color_new_list, "/path/you/save/VIDRLColor.json")
## push the VIDRLColor.json to github:: vidrl/VIDRLColor for later use
```

