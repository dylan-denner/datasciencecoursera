pollutanmean <- function(directory, pollutant, id = 1:332){
  # 'directory is a character vector of length 1 indicating
  # the location of the CSV files
  
  # 'pollutant' is a character vector or length 1 indicating
  # the name of the pollutant for which we will calculate the
  # mean; either "sulfate" or "nitrate"
  
  # 'id' is an integer vector indicating the monitor ID numbers
  # to be used
  
  # Return the mean of the pollutant across all monitors list
  # in the 'id' vector (ignoring NA values)
  # NOTE: Do not round the result!
  
  
  id_data <- numeric()
  
  for (x in id){
    if(x < 10){
      file_name <- paste("./", directory, "/00", toString(x), ".csv", sep = "")
    }else if (x > 9 && x < 100){
      file_name <- paste("./", directory, "/0", toString(x), ".csv", sep = "")
    }else{
      file_name <- paste("./", directory, "/", toString(x), ".csv", sep = "")
    }
    
    file_data <- read.csv(file_name)
    id_data <- c(id_data, file_data[[pollutant]])
    
  }
  print(mean(id_data, na.rm = TRUE))
}

pollutanmean("specdata", "sulfate", 1:10)
pollutanmean("specdata", "nitrate", 70:72)
pollutanmean("specdata", "nitrate", 23)


