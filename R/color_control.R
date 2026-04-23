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
    cat(paste('"', nm, '"', "=", '"', colors[[nm]], '"\n', sep=""))
  }
}

load_Colors <- function(){
  url <- "https://raw.githubusercontent.com/vidrl/VIDRLColor/main/VIDRLColor.json"
  #download.file(url, destfile="tmp.json", mode="w")
  #color_list <- readRDS(url("https://github.com/vidrl/VIDRLColor/blob/main/VIDRLColor.rds",method = "libcurl"))
  #rm tmp
  color_list <- fromJSON(url)
  return(color_list)
}

assign_variable_colors <- function(vars, palette_func = distinctColorPalette) {
  unique_vars <- unique(vars)
  colors <- palette_func(length(unique_vars))
  color_map <- setNames(colors, unique_vars)
  return(color_map[vars])
}
add_Colors <- function(samples, section, color_list=load_Colors()){
  #color_list <- load_Colors()
  #print(color_list)
  new_color_list <- assign_variable_colors(samples)
  section_list <- color_list[[section]]
  for (nm in names(new_color_list)){
    if (!(nm %in% names(section_list))){
      section_list[[nm]] <- new_color_list[[nm]]
    }
  }
  #print(section_list)
  color_list[[section]] <- section_list
  #print(color_list)
  return(color_list)
}

Get_Color_list <- function(section){
  color_list <- load_Colors()
  return(c(color_list[["fix"]], color_list[[section]]))
}



