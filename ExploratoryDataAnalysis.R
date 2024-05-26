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

# Frequency of categorical variables
table(liver_data$Status)
table(liver_data$Drug)
table(liver_data$Sex)
table(liver_data$Ascites)
table(liver_data$Hepatomegaly)
table(liver_data$Spiders)
table(liver_data$Edema)
table(liver_data$Stage)

# Mean, median, and mode for numerical variables
mean(liver_data$Age)
median(liver_data$Age)
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
Mode(liver_data$Age)

mean(liver_data$Bilirubin)
median(liver_data$Bilirubin)
Mode(liver_data$Bilirubin)

# Range for numerical variables
range(liver_data$Age)
range(liver_data$Bilirubin)

# Variance and standard deviation
var(liver_data$Age)
sd(liver_data$Age)
var(liver_data$Bilirubin)
sd(liver_data$Bilirubin)

# Quartiles
quantile(liver_data$Age)
quantile(liver_data$Bilirubin)

# Correlation matrix
cor_matrix <- cor(liver_data[, c("Age", "Bilirubin", "Cholesterol", "Albumin", "Copper", "Alk_Phos", "SGOT", "Tryglicerides", "Platelets", "Prothrombin")])
print(cor_matrix)
