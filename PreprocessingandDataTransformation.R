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

# Check for missing values in the dataset
missing_values <- colSums(is.na(liver_data))

# Print columns with missing values
print(missing_values[missing_values > 0])

# Delete rows with missing values
cleaned_liver_data <- na.omit(liver_data)

# Check the dimensions of the cleaned dataset
dim(cleaned_liver_data)

# Check for missing values in the cleaned dataset
missing_values_cleaned <- colSums(is.na(cleaned_liver_data))

# Print columns with missing values (if any)
print(missing_values_cleaned[missing_values_cleaned > 0])
