train <- read.csv('./kaggle/titanic/train.csv', header = TRUE)
test <- read.csv('./kaggle/titanic/test.csv', header = TRUE)
head(train)
head(test)

names(train)
names(test)
#Number of Data (rows)
#Raw data Visualization (Correlation Analysis)

#PassengerId : Passenger Id
#Pclass : ticket class, 1 high, 2 mid, 3low
#Name : Passanger Name
#

library(PerformanceAnalytics)
chart.Correlation(result, histogram=, pch="+")
cor(pclass, fare, method="spearman")
# 1. Figure out Data

SibSp
Parch
Ticket
Fare
Cabin Cabin Number
Embarked Loading Port

# 2. Visualize data with descriptive statistics (Mostly correlations)
# 3. Categorize if needed : Clustering
# 4. Decide Method.
# 5. 