# find out of sample errorfor each using validation data
# Out of sample error for the three models

rf_error <- as.numeric(1- cmrf$overall["Accuracy"])
dt_error <- as.numeric(1- cmdt$overall["Accuracy"])
gbm_error <- as.numeric(1- cmgbm$overall["Accuracy"])

rf_error
dt_error
gbm_error
# choose model
# concern overl 100% accuracy of RF (overfitting)
# choose GBM model

# use chosen model on test data

predict_test <- predict(GBMmodel, newdata=test_data)
predict_test