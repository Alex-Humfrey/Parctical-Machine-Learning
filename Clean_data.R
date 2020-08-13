# remove variables w/ missing vales

train_data <- training[, colSums(is.na(training)) == 0]
test_data <- testing[, colSums(is.na(testing)) == 0]

# remove variables which have no impact on the classe of the exercise
train_data <- train_data[, -(1:7)]
test_data  <- test_data[, -(1:7)]

dim(train_data);dim(test_data)
