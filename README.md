# Classification-QDA Program
#Objective
Write a program based on Quadratic Discriminant Analysis to classify a data set with k different classes
#Parameter Estimation:
•	We model each class density as multivariate Gaussian distribution. 
•	If we assume that the covariance matrices are same across all the k’s, it becomes Linear Discriminant Analysis method for classification.
•	QDA abandons the idea of assumption of the common covariance matrix.
•	We use the idea of log likelihood to define QDA. 
•	We select the category that attains the highest posterior probability
•	We estimate the QDA parameters from the training data:

#Classification Steps:
 •Using the training data, we estimate the parameters: prior probability, centroid, covariance matrix and inverse of covariance matrix for each class
•	Having estimated these parameters, we find the QDA for each class.
•	Our model is then ready to classify the test data
•	For each row of test data, we find QDA for each class: In this problem there are 11 QDAs. 
•	After evaluating the all the QDAs we find the one which is maximum and classify it to be that class. 
•	Then we find the misclassification error but comparing it with actual class of test data.
The misclassification error that we observed using the QDA program is 0.5281385



