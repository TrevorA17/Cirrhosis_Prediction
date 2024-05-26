# Load necessary libraries
library(plumber)
library(caret)
library(e1071)  # For SVM

# Load the saved SVM model
loaded_model_svm <- readRDS("./models/svm_model.rds")

#* @apiTitle Liver Disease Status Prediction API
#* @apiDescription Predict the liver disease status based on clinical features using an SVM model.

#* @post /predict_status
#* @param N_Days Numeric: Number of days between registration and the earlier of death, transplantation, or study analysis time.
#* @param Drug Character: Type of drug (D-penicillamine or placebo).
#* @param Age Numeric: Age in days.
#* @param Sex Character: Sex (M or F).
#* @param Ascites Character: Presence of ascites (N or Y).
#* @param Hepatomegaly Character: Presence of hepatomegaly (N or Y).
#* @param Spiders Character: Presence of spiders (N or Y).
#* @param Edema Character: Presence of edema (N, S, or Y).
#* @param Bilirubin Numeric: Serum bilirubin in mg/dl.
#* @param Cholesterol Numeric: Serum cholesterol in mg/dl.
#* @param Albumin Numeric: Albumin in gm/dl.
#* @param Copper Numeric: Urine copper in ug/day.
#* @param Alk_Phos Numeric: Alkaline phosphatase in U/liter.
#* @param SGOT Numeric: SGOT in U/ml.
#* @param Tryglicerides Numeric: Triglycerides in mg/dl.
#* @param Platelets Numeric: Platelets per cubic ml/1000.
#* @param Prothrombin Numeric: Prothrombin time in seconds.
#* @serializer unboxedJSON
predict_status <- function(N_Days, Drug, Age, Sex, Ascites, Hepatomegaly, Spiders, Edema, Bilirubin, Cholesterol, Albumin, Copper, Alk_Phos, SGOT, Tryglicerides, Platelets, Prothrombin) {
  # Prepare the input data
  new_data <- data.frame(
    N_Days = as.numeric(N_Days),
    Drug = as.character(Drug),
    Age = as.numeric(Age),
    Sex = as.character(Sex),
    Ascites = as.character(Ascites),
    Hepatomegaly = as.character(Hepatomegaly),
    Spiders = as.character(Spiders),
    Edema = as.character(Edema),
    Bilirubin = as.numeric(Bilirubin),
    Cholesterol = as.numeric(Cholesterol),
    Albumin = as.numeric(Albumin),
    Copper = as.numeric(Copper),
    Alk_Phos = as.numeric(Alk_Phos),
    SGOT = as.numeric(SGOT),
    Tryglicerides = as.numeric(Tryglicerides),
    Platelets = as.numeric(Platelets),
    Prothrombin = as.numeric(Prothrombin)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_model_svm, newdata = new_data)
  
  # Return the prediction
  return(as.character(prediction))
}
