library(dplyr)

run_analysis <- function () {
    dirPrefix <- "."
    # Check if UCI HAR Dataset directory exists.
    # If not we are assuming that script is placed inside dataset.
    if (file.exists("UCI HAR Dataset")) {
        dirPrefix <- "UCI HAR Dataset"
    }
        
    # Load features to data.frame and extract vector with features' names.
    features <- read.table(paste(dirPrefix, "features.txt", sep="/"))[,2]
    
    # Load both X_train and X_test files with features as column names and bind them together.
    X <- rbind(
        read.table(paste(dirPrefix, "train", "X_train.txt", sep="/"), col.names=features),
        read.table(paste(dirPrefix, "test", "X_test.txt", sep="/"), col.names=features)
    )
    
    # Extract only columns which contains ".mean." or ".std." instead them.
    data <- X[,grep('\\.(mean|std)\\.', names(X))]
        
    # Load both y_train and y_test and bind them as activity column
    data$activity <- rbind(
        read.table(paste(dirPrefix, "train", "y_train.txt", sep="/")),
        read.table(paste(dirPrefix, "test", "y_test.txt", sep="/"))    
    )[,1]
    
    # Load activity_labels and use them in activity column to replace
    # nondescriptive numbers to descriptive labels
    activities <- read.table(paste(dirPrefix, "activity_labels.txt", sep="/"))[,2]
    data$activity <- activities[data$activity]
        
    # Load and bind subject_train and subject_test to subject columns
    data$subject <- rbind(
        read.table(paste(dirPrefix, "train", "subject_train.txt", sep="/")),
        read.table(paste(dirPrefix, "test", "subject_test.txt", sep="/"))        
    )[,1]
    
    # Output created dataset into data.txt file
    write.table(data, file = "data.txt", row.name = FALSE)
    
    # Compute average of each variable for each activity and each subject
    # and save it to summary.txt
    summary <- data %>% group_by(activity, subject) %>% summarise_each(funs(mean))
    write.table(summary, file = "summary.txt", row.name = FALSE)
}