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