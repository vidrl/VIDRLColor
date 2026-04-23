library(dplyr)
library(randomcoloR)


initial_Colors <- function(){
  color_list <- list()
  fix_colors <- c("VIC"   = "#1F77B4",
                    "NT" = "#FF7F0E",
                    "QLD" = "#2CA02C",
                    "SA"   = "#D62728",
                    "TAS"  = "#9467BD",
                    "NSW" = "#FFD700",
                    "WA" = "#6A00FF",
                    "Unknown" = "#FFF8DC",
                    "International" = "#FFF5EE")
  color_list[["fix"]] = fix_colors
  return(color_list)
}

save_Colors <- function(color_list, filename){
  save(color_list, file=filename)
}

print_Colors <- function(color_list, section){
  colors <- color_list[[section]]
  for (nm in names(colors)){
    cat(paste('"', nm, '"', "=", '"', colors[nm], '"\n', sep=""))
  }
}

load_Colors

add_Colors <- function(samples, section){
  color_list <- load_Colors()
}

## test section
color_list <- initial_Colors()
color_list
print_Colors(color_list, "fix")
save_Colors(color_list, "VIDRLColor.Rdata")
