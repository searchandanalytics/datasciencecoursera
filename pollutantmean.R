pollutantmean <- function(directory , pollutant, id = 1:332) {
  
  # Use package for data frames
  library(plyr)
  
  #File Name with user input id
  filenames <- sprintf("%03d.csv", id)
  
  filenames <- paste(directory, filenames, sep="/")
  
  # Read all files
  data <- lapply(filenames, read.csv)
  
  # data.frame is list of data.frames
  data.frame=ldply(data)
  
  #Round mean upto 3 point
  round(mean(data.frame[, pollutant], na.rm = TRUE),digits=3)
  
}