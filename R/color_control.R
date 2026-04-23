library(dplyr)
library(randomcoloR)
library(jsonlite)

initial_Colors <- function(){
  color_list <- list()
  fix_colors <- list("VIC"   = "#1F77B4",
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

save_Colors <- function(color_list, filename="VIDRLColor.json"){
  #saveRDS(color_list, file=filename)
  #json_color <- toJSON(color_list)
  write_json(color_list, filename, pretty=TRUE)
}

print_Colors <- function(color_list, section){
  colors <- color_list[[section]]
  for (nm in names(colors)){
    cat(paste('"', nm, '"', "=", '"', colors[nm], '"\n', sep=""))
  }
}

load_Colors <- function(){
  url <- "https://github.com/vidrl/VIDRLColor/blob/main/VIDRLColor.json"
  #download.file(url, destfile="tmp.rds", mode="w")
  #color_list <- readRDS(url("https://github.com/vidrl/VIDRLColor/blob/main/VIDRLColor.rds",method = "libcurl"))
  #rm tmp
  color_list <- fromJSON(url)
  return(color_list)
}

add_Colors <- function(samples, section){
  color_list <- load_Colors()
}

## test section
#color_list <- initial_Colors()
#color_list
#print_Colors(color_list, "fix")
#save_Colors(color_list, "VIDRLColor.rds")

color_list <- load_Colors()

color_list <- initial_Colors()
json_color <- toJSON(color_list)

save_Colors(color_list)

data <- fromJSON("VIDRLColor.json")

data[["fix"]][["VIC"]][]
color_list[["fix"]][["VIC"]]
