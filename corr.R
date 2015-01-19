corr <- function(directory, threshold = 0) {
  
  ## Calling complete() for monitor id and "nobs" as the number of complete cases
  
  corrcomplete = complete(directory)
  
  #empty
  corrr = numeric()
  
  ##Retriving id having complete cases greator than threshold
  corrcompleteid = corrcomplete[corrcomplete$nobs > threshold, ]$id
  
  # summing id for testing empty
  t <- sum(corrcompleteid)
  
  filename <- sprintf("%03d.csv", corrcompleteid)
  
  #Concatenate for path
  filenames <- paste(directory, filename, sep="/")
  
  if (t ==0L) 
  {
    return (corrr) ## return empty if no id greater than threshold  
  }
  else
  {
    data <- lapply(filenames, read.csv) # Read all files
  }
  
  # Calculating correlation
  calculate.correlation = function(row) {
    completecases = complete.cases(row)
    cor(row[completecases, ]$sulfate, row[completecases, ]$nitrate)  
  }
  
  #Rounding values upto 5 point
  round(sapply(data, calculate.correlation),digits=5)
}