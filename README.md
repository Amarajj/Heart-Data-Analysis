
# Heart Disease Analysis Project
This project explores a dataset containing 303 patient records, focusing on seven key factors linked to heart attacks:


Age: Patient's age
Sex: Patient's gender
CP (Chest Pain Type):
1: Typical angina
2: Atypical angina
3: Non-anginal pain
4: Asymptomatic


BP: Resting blood pressure (mm Hg)
Chol: Cholesterol levels (mg/dl)
Sugar: Fasting blood sugar > 120 mg/dl (1 = True, 0 = False)
HR: Maximum heart rate achieved
Key Steps in the Analysis:


# Data Partitioning:
60% for training
30% for validation
10% for testing


# Correlation Analysis:
Highest correlation: Age and HR (-0.906)
Lowest correlation: Chol and BP (-0.388)


# Principal Component Analysis (PCA):

PC1 to PC3 explain 86.37% of the data variance

Recommended to use the first three components for accurate analysis


# Data Normalization:

Necessary due to different value ranges (e.g., Age vs. HR)

Ensures all variables contribute equally to the model
