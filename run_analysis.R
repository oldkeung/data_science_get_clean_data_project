run_analysis <- function(path = ".", sets = c("test", "train")) {
  
  library(dplyr)
    
  featureFile <- "features.txt"
  subjectFile <- "subject_train.txt"

  # %set% will be replaced with each set name
  
  subjectFile <- "subject_%set%.txt"
  setFile <- "X_%set%.txt"
  activityFile <- "y_%set%.txt"
  activityLabelFile <- "activity_labels.txt"
  
  # Get Features
  
  featureLabel <- read.table(file.path(path, featureFile))
  meanStdFeatureCol <- featureLabel[grep("mean\\(\\)|std\\(\\)", featureLabel[,2]), ]
  
  meanStdFeatureCol[[2]] = gsub("mean", "Mean", gsub("std", "Std", gsub("[()-]","", meanStdFeatureCol[[2]])))
  
  # Get Activity
  
  activityLabel <- read.table(file.path(path, activityLabelFile))
  activityLabel[, 1] <- as.factor(activityLabel[, 1])

  allSetData <- data.frame()
      
  for (set in sets) {
    
    setPath <- file.path(path, set)
    
    ## Read Subject Data
    
    data <- read.table(file.path(setPath, sub("%set%", set, subjectFile)))
    
    names(data)[1] <- "Subject"
    data[, 1] <- as.factor(data[, 1])
    
    # Read Activity Data
    
    activityData <- read.table(file.path(setPath, sub("%set%", set, activityFile)))

    activityData[, 1] <- as.factor(activityData[, 1])
    
    activityData <- inner_join(x = activityData, y = activityLabel, by = c("V1" = "V1"))
        
    data <- cbind(data, select(activityData, 2))
        
    # Read Set Data
    
    setData <- read.table(file.path(setPath, sub("%set%", set, setFile)))
    
    setData <- select(setData, meanStdFeatureCol[[1]])
    
    data <- cbind(data, setData)
    
    allSetData <- rbind(allSetData, data)
    
  }
  
  names(allSetData) <- c("Subject", "Activity", as.vector(meanStdFeatureCol[[2]]))
  
  allSetData %>% group_by(Activity, Subject) %>% summarise_all(mean)

}