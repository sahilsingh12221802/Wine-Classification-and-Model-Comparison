# Importing Libraries
library(class)
library(rpart)
library(caret)
library(ggplot2)
library(plotly)

# Load dataset
wine_data <- read.csv("WineData.csv")

# PreProcessing
str(wine_data)
summary(wine_data)
View(wine_data)
wine_data <- na.omit(wine_data)
wine_data$Type <- as.factor(wine_data$Type)
numerical_features <- wine_data[, -ncol(wine_data)]
scaled_features <- scale(numerical_features)
wine_data_scaled <- as.data.frame(scaled_features)
wine_data_scaled$Type <- wine_data$Type

# Partition (Test-20%, Train-80%, Based on rows)
set.seed(123)
train_index <- sample(1:nrow(wine_data_scaled), 0.8 * nrow(wine_data_scaled))
train_data <- wine_data_scaled[train_index, ]
test_data <- wine_data_scaled[-train_index, ]

# Evaluation KNN
knn_pred <- knn(train = train_data[, -ncol(train_data)], test = test_data
                [, -ncol(test_data)], cl = train_data$Type, k = 3)
knn_accuracy <- sum(knn_pred == test_data$Type) / length(test_data$Type)
print(paste("KNN Accuracy:", knn_accuracy))

# Evaluation Decision-Tree
dt_model <- rpart(Type ~ ., data = train_data, method = "class")
dt_pred <- predict(dt_model, test_data, type = "class")
dt_accuracy <- sum(dt_pred == test_data$Type) / length(test_data$Type)
print(paste("Decision Tree Accuracy:", dt_accuracy))

# Comparison
comparison <- data.frame(Model = c("KNN", "Decision Tree"), 
                         Accuracy = c(knn_accuracy, dt_accuracy))

# Confusion Matrix
knn_cm <- confusionMatrix(knn_pred, test_data$Type)
dt_cm <- confusionMatrix(dt_pred, test_data$Type)

# Dashboards
# 1. Accuracy comparison bar plot
accuracy_plot <- ggplot(comparison, aes(x = Model, y = Accuracy, fill = Model)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = round(Accuracy, 2)), vjust = -0.5) +
  theme_minimal() +
  labs(title = "Model Accuracy Comparison", x = "Model", y = "Accuracy") +
  scale_fill_manual(values = c("KNN" = "red", "Decision Tree" = "orange"))
accuracy_plot <- ggplotly(accuracy_plot)
print(accuracy_plot)

# 2. Confusion matrix heatmap for KNN
knn_cm_plot <- ggplot(as.data.frame(knn_cm$table), 
                      aes(Prediction, Reference, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "red") +
  theme_minimal() +
  labs(title = "KNN Confusion Matrix", x = "Prediction", y = "Reference")
knn_cm_plot <- ggplotly(knn_cm_plot)
print(knn_cm_plot)

# 3. Confusion matrix heatmap for Decision Tree
dt_cm_plot <- ggplot(as.data.frame(dt_cm$table), 
                     aes(Prediction, Reference, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  theme_minimal() +
  labs(title = "Decision Tree Confusion Matrix", x = "Prediction", y = "Reference")
dt_cm_plot <- ggplotly(dt_cm_plot)
print(dt_cm_plot)

# 4. Feature importance plot for Decision Tree
dt_importance <- as.data.frame(varImp(dt_model))
dt_importance_plot <- ggplot(dt_importance, 
        aes(x = reorder(rownames(dt_importance), Overall), y = Overall)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal() +
  labs(title = "Feature Importance for Decision Tree", x = "Features", y = "Importance")
dt_importance_plot <- ggplotly(dt_importance_plot)
print(dt_importance_plot)
