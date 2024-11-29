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


