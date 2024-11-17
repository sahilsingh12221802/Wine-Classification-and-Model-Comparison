
![KNN Vs Decision](https://github.com/user-attachments/assets/e0be9634-692f-485f-a416-6d231be13048)


# Wine Classification and Model Comparison (KNN And Decision Tree)

## Overview

This project focuses on classifying wine types based on various chemical features using machine learning algorithms. It compares the performance of two popular classifiers: **K-Nearest Neighbors (KNN)** and **Decision Trees**. The project also includes visualizations to aid in understanding model performance and feature importance.

## Features

- **Data Preprocessing**: Cleaning and scaling of numerical features.
- **K-Nearest Neighbors (KNN)**: Implementing KNN for wine classification.
- **Decision Tree Classifier**: Training and evaluating a Decision Tree model for classification.
- **Model Comparison**: Comparing the accuracy of KNN and Decision Tree models.

## Visualization
- Accuracy comparison bar plot.
- Confusion matrix heatmaps for both models.
- Feature importance plot for Decision Tree.

## Dataset

The dataset used in this project contains various features of wine (e.g., alcohol content, malic acid, ash, etc.) and the wine type (classified as red or white). The dataset is preprocessed by removing missing values, scaling the features, and encoding the target variable as a factor.

## Installation

To run this project, you need to have R installed. You can also install the necessary libraries by running:

```R
install.packages(c("class", "rpart", "caret", "ggplot2", "plotly"))
```
## How to Run

- 1. Download the dataset (WineData.csv) and place it in your working directory.
- 2. Run the wine_classification.R script to perform data preprocessing, model training, and evaluation.
- 3. View the visualizations generated for the model comparison and confusion matrices.


## Visualizations
The following visualizations are included in the project:

- **Model Accuracy Comparison:** A bar plot comparing the accuracy of KNN and Decision Tree classifiers.
- **Confusion Matrix Heatmap (KNN):** Visual representation of KNN's performance using a heatmap.
- **Confusion Matrix Heatmap (Decision Tree):** Visual representation of Decision Tree's performance using a heatmap.
- **Feature Importance Plot:** Bar chart showing the importance of features used in the Decision Tree model.

## Conclusion
This project provides insights into how different machine learning models perform on the same dataset. By comparing KNN and Decision Trees, the project also demonstrates the importance of model evaluation and visualization in machine learning.



