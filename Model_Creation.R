# random forest - model creation, model summary

library(randomForest); library(rpart); library(rpart.plot); library(RColorBrewer); library(rattle)
library(gbm)
set.seed(125)

RFModel <- randomForest(classe ~ ., data=train_data, ntree = 500, importance = TRUE)
RFModel$finalModel

#predict on the validation set, and create confusions Matrix
predictRF <- predict(RFModel, newdata=valid_data)
cmrf <- confusionMatrix(predictRF, valid_data$classe)
cmrf


# classification tree  - model creation, model summary

set.seed(12345)
DTmodel <- train(classe ~ ., data=train_data, method="rpart")
DTmodel$finalModel
fancyRpartPlot(DTmodel)

#predict on validation data set
predictDT <- predict(DTmodel, newdata=valid_data)
cmdt <- confusionMatrix(predictDT, valid_data$classe)
cmdt

# generalised boosting model  - model creation, model summary

set.seed(1235)
controlGBM <- trainControl(method = "repeatedcv", number = 5, repeats = 1)
GBMmodel  <- train(classe ~ ., data=train_data, method = "gbm",
                    trControl = controlGBM, verbose = FALSE)
GBMmodel$finalModel

#predict on validation data set

predictGBM <- predict(GBMmodel, newdata=valid_data)
cmgbm <- confusionMatrix(predictGBM, valid_data$classe)
cmgbm