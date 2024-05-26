# Load necessary libraries
library(caret)
library(e1071)  # For SVM

# Define control for cross-validation
control <- trainControl(method = "cv", number = 10)

# Train SVM model
set.seed(123)  # For reproducibility
model_svm <- train(Status ~ ., data = train_data, method = "svmRadial", trControl = control)

# Create a directory named "models" if it doesn't exist
if (!file.exists("./models")) {
  dir.create("./models")
}

# Save the trained SVM model to a file
saveRDS(model_svm, file = "./models/svm_model.rds")

# Load the saved SVM model
loaded_model_svm <- readRDS("./models/svm_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  N_Days = 4000,
  Age = 5000,
  Sex = "M",
  Drug = "D-penicillamine",
  Status = "C",  # You can put any placeholder value here since it's the target variable
  Ascites = "N",
  Hepatomegaly = "N",
  Spiders = "N",
  Edema = "N",
  Bilirubin = 1.2,
  Cholesterol = 150,
  Albumin = 3.5,
  Copper = 50,
  Alk_Phos = 100,
  SGOT = 40,
  Tryglicerides = 120,
  Platelets = 200,
  Prothrombin = 12,
  Stage = "1"  # You can put any placeholder value here since it's not needed for prediction
)

# Use the loaded model to make predictions for new data
predictions_loaded_model <- predict(loaded_model_svm, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
