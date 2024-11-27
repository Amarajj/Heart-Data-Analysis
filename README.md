# HeartData Project
# Heart Attack Analysis Overview
This project analyzes a dataset containing 303 patients' data to explore factors impacting heart attacks. The study includes correlation analysis, principal component analysis (PCA), and data normalization.
# Dataset Description:
The dataset contains 7 variables:

Age: Age of the patient
Sex: Sex of the patient
CP (Chest Pain Type):
1: Typical angina
2: Atypical angina
3: Non-anginal pain
4: Asymptomatic
BP: Resting blood pressure (mm Hg)
Chol: Cholesterol level (mg/dl)
Sugar: Fasting blood sugar > 120 mg/dl (1 = True, 0 = False)
HR: Maximum heart rate achieved

#  Data Partitioning:
Training Set: 60%
Validation Set: 30%
Testing Set: 10%

# Correlation Analysis (Training Data):
Quantitative Variables Analyzed: Age, BP, Chol, HR

Highest Correlation:
Age and HR: -0.906 (Strong negative correlation)
Interpretation: As Age increases, HR decreases.
Lowest Correlation:
Chol and BP: -0.388 (Moderate negative correlation)
Interpretation: Cholesterol levels and blood pressure have a weaker, inverse relationship.

# Principal Component Analysis (PCA):
PCA Results:

PC1:
Standard Deviation: 1.217
Variance Explained: 37.0%
PC2:
Standard Deviation: 1.006
Variance Explained: 25.28%
PC3:
Standard Deviation: 0.982
Variance Explained: 24.08%
PC4:
Standard Deviation: 0.738
Variance Explained: 13.63%


Principal Component Selection:
Suggested Components: PC1, PC2, and PC3
Cumulative Variance Explained:
PC1: 37.0%
PC1 + PC2: 62.29%
PC1 + PC2 + PC3: 86.37%
Interpretation: The first three components capture 86.37% of the data's variability, providing a comprehensive dataset summary.


# Data Normalization:
Reason: Variables (Age, BP, Chol, HR) are on different scales.

Method: Scale () function was used to normalize the data.

Benefit: Ensures all variables contribute equally to the analysis, improving PCA performance and correlation accuracy.

# Conclusion:
This analysis demonstrates key predictors of heart health and effectively reduces data dimensions using PCA. Normalization and careful selection of principal components ensure robust insights for modeling and further analysis.



![image](https://github.com/user-attachments/assets/09119161-ed5d-45f2-9a78-a74dbbc502c3)



<!-- This content will not be displayed 
This is the R-Script

Testing visualization For heartData project
setwd("/Users/amarachukwuobi/Desktop/gethubTest")
install.packages("dplyr")
library(dplyr)

ylibrary(caret)
library(psych)
heart_data <- read.csv("Heart.csv")
set.seed(123)
trainIndex <- createDataPartition(heart_data$Age, p = 0.6, list = FALSE)
train_data <- heart_data[trainIndex, ]
remaining_data <- heart_data[-trainIndex, ]
validIndex <- createDataPartition(remaining_data$Age, p = 0.5, list = FALSE)
validation_data <- remaining_data[validIndex, ]
test_data <- remaining_data[-validIndex, ]
quantitative_data <- train_data %>% select(Age, BP, Chol, HR)
cor_matrix <- cor(quantitative_data)
print(cor_matrix)
cor_pairs <- as.data.frame(as.table(cor_matrix))
highest_cor <- cor_pairs[which.max(cor_pairs$Freq), ]
lowest_cor <- cor_pairs[which.min(cor_pairs$Freq), ]
print(paste("Highest correlation:", highest_cor$Var1, "and", highest_cor$Var2, "with value", highest_cor$Freq))
round(cor(cor_matrix), 3)
print(paste("Lowest correlation:", lowest_cor$Var1, "and", lowest_cor$Var2, "with value", lowest_cor$Freq))
pca <- prcomp(quantitative_data, scale. = TRUE)
summary(pca)
pca_scores <- as.data.frame(pca$x)
head(pca_scores)
eigenvalues <- pca$sdev^2
variance_explained <- cumsum(eigenvalues) / sum(eigenvalues)
print(variance_explained)
num_components <- 3  # or set this to any number you need
print(paste("Proportion of variance explained by", num_components, "components:", variance_explained[num_components],3))

normalized_data <- scale(quantitative_data)
normalized_cor_matrix <- cor(normalized_data)
print("Correlation matrix after normalization:")
print(normalized_cor_matrix)

# Select quantitative data columns
quantitative_data <- train_data %>% select(Age, BP, Chol, HR)

# Basic scatterplot matrix
pairs(quantitative_data, main = "Scatterplot Matrix of Quantitative Data")

-->

