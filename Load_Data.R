library(dplyr);library(ggplot2);library(caret); library(randomForest); library(rpart); 
library(rpart.plot); library(RColorBrewer); library(rattle); library(gbm)

url_train <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
url_test <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

destfile_train <- "/Users/alexhumfrey/Documents/Data Science Coursera/Scripts/PracticalMachineLearning/train_data.csv"
destfile_test <- "/Users/alexhumfrey/Documents/Data Science Coursera/Scripts/PracticalMachineLearning/test_data.csv"

download.file(url_train, destfile = destfile_train)
download.file(url_test, destfile = destfile_test)

training <- read.csv(destfile_train)
dim(training)
testing <- read.csv(destfile_test)
dim(test)

# there are 19622 obs. of 160 variables in the training set
# there are 20 obs of 160 variables in the test set

# lots of variables have only NAs