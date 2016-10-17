# Classification-QDA Program
Machine Learning: Classification using Quadratic Discriminant Analysis 
**Objective**
Write a program based on Quadratic Discriminant Analysis to classify a data set with k different classes

**Parameter Estimation**

a. We model each class density as multivariate Gaussian distribution. 

b. If we assume that the covariance matrices are same across all the k’s, it becomes Linear Discriminant Analysis method for classification.

c.	QDA abandons the idea of assumption of the common covariance matrix.

d.	We use the idea of log likelihood to define QDA. 

e.	We select the category that attains the highest posterior probability

f.	We estimate the QDA parameters from the training data:

**Classification Steps**

a.Using the training data, we estimate the parameters: prior probability, centroid, covariance matrix and inverse of covariance matrix for each class

b.	Having estimated these parameters, we find the QDA for each class.

c.	Our model is then ready to classify the test data

d.	For each row of test data, we find QDA for each class: In this problem there are 11 QDAs. 

e.	After evaluating the all the QDAs we find the one which is maximum and classify it to be that class. 

f.Then we find the misclassification error but comparing it with actual class of test data.

The misclassification error that we observed using the QDA program is 0.5281385



