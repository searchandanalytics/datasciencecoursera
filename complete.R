complete <- function(directory, id=1:332) {
  
  
  #File Name with user input id
  filenames <- sprintf("%03d.csv", id)
  
  filenames <- paste(directory, filenames, sep="/")
  
  # Read all files
  data <- lapply(filenames, read.csv)
  
  # Remove the incomplete cases using na.omit
  y <- lapply(data, na.omit)
  
  # Clean files and use sapply to make a vector
  nobs <- sapply(y, nrow)
  
  # Data frames and count of complete case
  completecase <- data.frame(id, nobs)
  
  return(completecase)
  
}