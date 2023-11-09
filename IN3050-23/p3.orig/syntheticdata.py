import numpy as np
from sklearn import datasets


def get_synthetic_data1(n=100):
    np.random.seed(3050)
    mu = np.array([2,3])
    Sigma = np.array([[2,-2],[-2,3]]) 
    X = np.random.multivariate_normal(mu,Sigma,n)
    
    return X

def get_synthetic_data_with_labels1(n=100):
    np.random.seed(4050)
    n1 = int(np.ceil(n/2))
    mu1 = np.array([2,3])
    Sigma1 = np.array([[1,-1],[-1,2]])    
    X1 = np.random.multivariate_normal(mu1,Sigma1,n1)
    y1 = np.zeros(n1).reshape((n1,1))
    
    n2 = int(np.floor(n/2))
    mu2 = np.array([6,-1])
    Sigma2 = np.array([[1,-1],[-1,2]])    
    X2 = np.random.multivariate_normal(mu2,Sigma2,n2)
    y2 = np.ones(n2).reshape((n2,1))
    
    X = np.vstack((X1,X2))
    y = np.vstack((y1,y2))
    
    sorting = np.random.permutation(n)
    X = X[sorting]
    y = y[sorting]
    
    return X,y

def get_synthetic_data_with_labels2(n=100):
    np.random.seed(42)
    n1 = int(np.ceil(n/2))
    mu1 = np.array([2,3])
    Sigma1 = np.array([[1,-1],[-1,2]])    
    X1 = np.random.multivariate_normal(mu1,Sigma1,n1)
    y1 = np.zeros(n1).reshape((n1,1))
    
    n2 = int(np.floor(n/2))
    mu2 = np.array([1,2])
    Sigma2 = np.array([[1,-1],[-1,2]])    
    X2 = np.random.multivariate_normal(mu2,Sigma2,n2)
    y2 = np.ones(n2).reshape((n2,1))
    
    X = np.vstack((X1,X2))
    y = np.vstack((y1,y2))
    
    sorting = np.random.permutation(n)
    X = X[sorting]
    y = y[sorting]
    
    return X,y

def get_iris_data():
    iris = datasets.load_iris()
    X = iris.data
    y = iris.target
    return X,y 

def get_lfw_data():
    lfw = datasets.fetch_lfw_people(min_faces_per_person=70)
    X = lfw.data
    y = lfw.target
    _,h,w = lfw.images.shape
    return X,y,h,w 
