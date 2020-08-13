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


# predictor correlation plot

corMatrix <- cor(train_data[, -53])
corrplot(corMatrix, order = "FPC", method = "color", type = "lower", 
         tl.cex = 0.8, tl.col = rgb(0, 0, 0))
