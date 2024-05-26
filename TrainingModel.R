# Load dataset
liver_data <- read.csv("data/cirrhosis.csv", colClasses = c(
  N_Days = "numeric",
  Status = "factor",
  Drug = "factor",
  Age = "numeric",
  Sex = "factor",
  Ascites = "factor",
  Hepatomegaly = "factor",
  Spiders = "factor",
  Edema = "factor",
  Bilirubin = "numeric",
  Cholesterol = "numeric",
  Albumin = "numeric",
  Copper = "numeric",
  Alk_Phos = "numeric",
  SGOT = "numeric",
  Tryglicerides = "numeric",
  Platelets = "numeric",
  Prothrombin = "numeric",
  Stage = "factor"
))

# Display the structure of the dataset
str(liver_data)

# View the first few rows of the dataset
head(liver_data)

# View the dataset in a separate viewer window
View(liver_data)

# Set seed for reproducibility
set.seed(123)

# Split data into training and testing sets (e.g., 80% train, 20% test)
train_indices <- sample(1:nrow(cleaned_liver_data), 0.8*nrow(cleaned_liver_data))
train_data <- cleaned_liver_data[train_indices, ]
test_data <- cleaned_liver_data[-train_indices, ]

dim(train_data)
dim(test_data)

# Perform bootstrapping on Cholesterol
bootstrap_chol <- function(data, num_bootstraps) {
  bootstrap_means <- numeric(num_bootstraps)
  for (i in 1:num_bootstraps) {
    bootstrap_sample <- sample(data$Cholesterol, replace = TRUE)
    bootstrap_means[i] <- mean(bootstrap_sample)
  }
  return(bootstrap_means)
}

# Number of bootstraps
num_bootstraps <- 1000

# Run bootstrapping
bootstrap_means_chol <- bootstrap_chol(cleaned_liver_data, num_bootstraps)

# Summary of bootstrapped means
summary(bootstrap_means_chol)

# Example using basic k-fold cross-validation with logistic regression
library(caret)

# Define control parameters for cross-validation
control <- trainControl(method = "cv", number = 5)


# Train logistic regression model using cross-validation
model <- train(Status ~ ., data = train_data, method = "rf", trControl = control)

# Print model performance
print(model)

# Train multinomial logistic regression model
library(nnet)
model_multinom <- multinom(Status ~ ., data = train_data)

# Print model summary
summary(model_multinom)

# Make predictions on the test set
predictions_multinom <- predict(model_multinom, newdata = test_data)

# Evaluate model performance
confusionMatrix(predictions_multinom, test_data$Status)

# Train random forest model
library(randomForest)
model_rf <- randomForest(Status ~ ., data = train_data)

# Print model summary
print(model_rf)

# Make predictions on the test set
predictions_rf <- predict(model_rf, newdata = test_data)

# Evaluate model performance
confusionMatrix(predictions_rf, test_data$Status)

# Train SVM model
library(e1071)
model_svm <- svm(Status ~ ., data = train_data)

# Print model summary
print(model_svm)

# Make predictions on the test set
predictions_svm <- predict(model_svm, newdata = test_data)

# Evaluate model performance
confusionMatrix(predictions_svm, test_data$Status)

# Load necessary libraries
library(caret)
library(e1071)  # For SVM
library(nnet)  # For neural networks
library(randomForest)  # For random forest

# Define control for cross-validation
control <- trainControl(method = "cv", number = 10)

# Train SVM model
set.seed(123)  # For reproducibility
model_svm <- train(Status ~ ., data = train_data, method = "svmRadial", trControl = control)

# Train neural network (nnet) model
set.seed(123)
model_nnet <- train(Status ~ ., data = train_data, method = "nnet", trControl = control, trace = FALSE, linout = TRUE)

# Train multinomial logistic regression model
set.seed(123)
model_multinom <- train(Status ~ ., data = train_data, method = "multinom", trControl = control, trace = FALSE)

# Train random forest model
set.seed(123)
model_rf <- train(Status ~ ., data = train_data, method = "rf", trControl = control)

# Aggregate results using resamples
results <- resamples(list(SVM = model_svm, NNet = model_nnet, Multinom = model_multinom, RF = model_rf))

# Print summary of the results
summary(results)

# Plot comparisons
dotplot(results)



