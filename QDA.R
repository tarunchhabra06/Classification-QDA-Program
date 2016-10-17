#Reading the data 
data.test.q2<-read.table("vowel.test.data")
data.train.q2<-read.table("vowel.train.data")

#defining the error function
error.fun <- function(matr) {
  total<-sum(matr)
  err<-1-( sum(diag(matr))/total) 
  return (err)
}

#defining the QDA function

QDA.disc<-function(x, sigma_k, sigma_inv_k, mew_k,pi_k){
  disc.dummy<- (-0.5)*log(det(sigma_k)) - (0.5)* as.matrix((x-mew_k)) %*% as.matrix(sigma_inv_k) %*% as.matrix(t((x-mew_k))) + log(pi_k)
  return(disc.dummy)
}

library(MASS)

#defining parameters 
prior.prob<-rep(0,11)
centroids<-as.list(1:11)
cov.mat.inverse<-as.list(1:11)
cov.mat<-as.list(1:11)
n.train<-nrow(data.train.q2)
n.test<-nrow(data.test.q2)
QDA.discriminant<-rep(0,11)
y.hat<-rep(0,n.test)


for (k in 1:11){
  nk<-length(data.train.q2[data.train.q2[, 1] %in% c(k), 1:1])
  #Finding prior probabilities
  prior.prob[k] = nk/n.train
  #Read the data for kth class
  xk<-data.train.q2[data.train.q2[, 1] %in% c(k), 2:11]
  #Find Covariance matrix
  cov.mat[[k]]=cov(xk)
  #Find the inverse of covariance matrix
  cov.mat.inverse[[k]]=solve(cov.mat[[k]])
  #Find the centroid
  dummy.matrix<- matrix( rep( 1, len=nk*nk), ncol = nk)
  centroids.mat<-(dummy.matrix %*% as.matrix(xk))/nk
  centroids[[k]]<-centroids.mat[1,]
}

#Now that we know all the parameters per class, we can now go through the test data row by row and find corresponding QDA and classify
for (i in 1:n.test){
  for (k in 1:11){
    QDA.discriminant[k]<-QDA.disc(data.test.q2[i,-1],cov.mat[[k]],cov.mat.inverse[[k]],centroids[[k]],prior.prob[k])
  }
  max.k<-which.max(QDA.discriminant)
  y.hat[i]<-max.k
}

QDA.error<-error.fun(table(y.hat,data.test.q2$y))
QDA.error
