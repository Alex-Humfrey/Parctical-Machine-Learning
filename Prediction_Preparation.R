## prepare data for prediction

# split to train and validation 
set.seed(12432) 
inTrain <- createDataPartition(train_data$classe, p = 0.7, list = FALSE)
train_data <- train_data[inTrain, ]
valid_data <- train_data[-inTrain, ]
dim(train_data)
dim(valid_data)

#remove variables with near zero variance
NZV <- nearZeroVar(train_data)
train_data <- train_data[, -NZV]
valid_data  <- valid_data[, -NZV]
dim(train_data)
dim(valid_data)

