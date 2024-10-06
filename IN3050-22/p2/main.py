#!/usr/bin/env python3
import csv
import numpy as np
import matplotlib.pyplot as plt
import sklearn
from sklearn.datasets import make_blobs

# from utils import pprint as print

def generate_data():
    class Dataset:
        def __init__(self, train, values, test):
            self.train = train
            self.values = values
            self.test = test

    X, t = make_blobs(
            n_samples=[400, 400, 400, 400, 400],
            # n_samples=[0,0,4,0,5],
            centers=[(0,1),(4,1),(8,1),(2,0),(6,0)], 
            n_features=2,
            random_state=2022,
            cluster_std=1.0,
            )
    indices = np.arange(X.shape[0])
    rng = np.random.RandomState(2022)
    rng.shuffle(indices)

    train_slice = indices[:1000]
    values_slice = indices[1000:1500]
    test_slice = indices[1500:]

    X_train = X[train_slice,:]
    X_val = X[values_slice,:]
    X_test = X[test_slice,:]
    X_data = Dataset(X_train, X_val, X_test)

    t1_train = t[train_slice]
    t1_val = t[values_slice]
    t1_test = t[test_slice]
    t1_data = Dataset(t1_train, t1_val, t1_test)

    t2_train = (t1_train >= 3).astype('int')
    t2_val = (t1_val >= 3).astype('int')
    t2_test = (t1_test >= 3).astype('int')
    t2_data = Dataset(t2_train, t2_val, t2_test)

    return (X_data, t1_data, t2_data)

def plot_decision_regions(X, t, clf=[], size=(8,8), history=[]):
    data_subplots = [(t, clf, history)]
    plot_multiple_decision_regions(X, data_subplots, size=size)

def plot_multiple_decision_regions(X, data_subplots, size=(10,10)):
    # plt.figure(figsize=size) # You may adjust this
    fig, ax = plt.subplots(len(data_subplots), 2, figsize=size)
    xx_min, xx_max = None, None
    yy_min, yy_max = None, None
    for i, (t, clf, history) in enumerate(data_subplots):
        # matplotlib doesn't support 2D if there is a single column, for whatever reason
        dataax = ax[i,0] if len(data_subplots)>1 else ax[0]
        histax = ax[i,1] if len(data_subplots)>1 else ax[1]

        # Plot the decision boundary. For that, we will assign a color to each
        # point in the mesh [x_min, x_max]x[y_min, y_max].
        x_min, x_max = X[:, 0].min() - 1, X[:, 0].max() + 1
        y_min, y_max = X[:, 1].min() - 1, X[:, 1].max() + 1
        h = 0.02  # step size in the mesh
        xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
        Z = clf.predict(np.c_[xx.ravel(), yy.ravel()])

        # Put the result into a color plot
        Z = Z.reshape(xx.shape)

        dataax.contourf(xx, yy, Z, alpha=0.2, cmap = 'Paired')

        dataax.scatter(X[:,0], X[:,1], c=t, s=20.0, cmap='Paired')

        xx_min = min(xx.min(), xx_min) if xx_min else xx.min()
        yy_min = min(yy.min(), yy_min) if yy_min else yy.min()
        xx_max = max(xx.max(), xx_max) if xx_max else xx.max()
        yy_max = max(yy.max(), yy_max) if yy_max else yy.max()

        dataax.set_xlim(xx_min, xx_max)
        dataax.set_ylim(yy_min, yy_max)

        histax.plot(np.array(range(0, len(history))), np.array(history))
        histax.set_ylim([0, 1])
        histax.yaxis.tick_right()
        histax.grid(True, which="both")
        histax.tick_params(which="minor", length=5)
        histax.minorticks_on()
        if i == 0:
            histax.set_title("Accuracy over time")
            dataax.set_title("Decision regions")

    histax.get_xaxis().set_visible(True)


class NumpyClassifier():
    """Common methods to all numpy classifiers --- if any"""
    def __init__(self, datapoints, categories, epochs=100):
        self.datapoints = datapoints
        self.categories = categories
        self.epochs = epochs
        self.errors = []
        self.history = []

    @property
    def acc(self):
        return self.accuracy(self.datapoints.values, self.categories.values)

    def accuracy(self, datapoints, y_test, **kwargs):
        pred = self.predict(datapoints, **kwargs)
        if len(pred.shape) > 1:
            pred = pred[:,0]
        return sum([p==y for p, y in zip(pred, y_test)])/len(pred)


    @staticmethod
    def calculate_squared_error(actual, predicted):
        return np.sum((actual - predicted)**2)/len(actual)

    @staticmethod
    def add_bias(datapoints):
        # Put bias in position 0
        sh = datapoints.shape
        if len(sh) == 1:
            #X is a vector
            return np.concatenate([np.array([1]), X])
        else:
            # X is a matrix
            m = sh[0]
            bias = np.ones((m,1)) # Makes a m*1 matrix of 1-s
            return np.concatenate([bias, datapoints], axis  = 1) 

    def run_model(self):
        print(f"Running model: {self.model_name}")
        self.fit(self.datapoints.train, self.categories.train, epochs=self.epochs)

    def display(self):
        plot_decision_regions(self.datapoints.train, self.categories.train, self, history=self.history)
        print(f"Squared error values over time: {self.errors}")
        print(f"Final accuracy: {self.acc}")

        plt.show()
        print("")



class NumpyLinReg(NumpyClassifier):
    model_name = "Linear regression"
    def fit(self, datapoints, categories, eta=0.01, epochs=1000, diff=0.00001):
        (k, m) = datapoints.shape
        datapoints = self.add_bias(datapoints)

        self.weights = weights = np.zeros(m+1)
        self.errors.clear()
        self.history.clear()

        for _ in range(epochs):
            error = self.calculate_squared_error(categories, datapoints @ weights)
            self.errors.append(error)
            self.history.append(self.acc)

            weights -= ( eta / k ) * ( datapoints.T @ (datapoints @ weights - categories) )

            next_error = self.calculate_squared_error(categories, datapoints @ weights)
            if abs(error - next_error) <= diff:
                break

    def predict(self, datapoints, threshold=0.5):
        z = self.add_bias(datapoints)
        score = z @ self.weights
        return score > threshold


class NumpyLogReg(NumpyClassifier):
    model_name = "Logistic regression"
    def fit(self, datapoints, categories, eta = 0.1, epochs=10, diff=0.00001, classifier_values=None):
        (k, m) = datapoints.shape
        datapoints = self.add_bias(datapoints)

        self.weights = weights = np.zeros(m+1)
        self.errors.clear()
        self.history.clear()

        for _ in range(epochs):
            error = self.calculate_squared_error(categories, datapoints @ weights)
            self.errors.append(error)

            weights -= (eta / k) * ( datapoints.T @ (self.forward(datapoints) - categories) )
            # self.cross_entropy_loss(categories, datapoints @ weights)
            if classifier_values is not None:
                self.history.append(self.accuracy(self.datapoints.values, classifier_values))
            else:
                self.history.append(self.acc)


            next_error = self.calculate_squared_error(categories, datapoints @ weights)
            if abs(error - next_error) <= diff:
                break

    @staticmethod
    def cross_entropy_loss(actual, predicted):
        loss = -np.sum(actual * np.log(predicted))
        return loss/len(actual)


    @staticmethod
    def logistic(x):
        return 1 / (1 + np.exp(-x))

    def forward(self, datapoints):
        return self.logistic(datapoints @ self.weights)

    def score(self, datapoints):
        z = self.add_bias(datapoints)
        score = self.forward(z)   
        return score

    def predict(self, datapoints, threshold=0.5):
        z = self.add_bias(datapoints)
        score = self.forward(z)
        return (score>threshold).astype('int')    


class NumpyOneVsRest(NumpyLogReg):
    model_name = "One-vs-Rest regression"
    def fit(self, datapoints, categories, eta=0.1, epochs=100000, diff=0.0001):
        self.best_classifier = None
        self.all_models = []
        self.all_classifiers = []
        for i in range(5):  # we have 5 different colours in the dataset
            classifier_values = (self.categories.values == i).astype('int')
            classifier_train = (self.categories.train == i).astype('int')

            model = NumpyLogReg(self.datapoints, self.categories)
            model.fit(datapoints, classifier_train, eta, epochs, diff, classifier_values=classifier_values )

            self.all_models.append(model)
            self.all_classifiers.append(classifier_train)


    @property
    def acc(self):
        return max(
            model.accuracy(self.datapoints.values, classifier)
            for (model, classifier)
            in zip(self.all_models, self.all_classifiers)
        )

    @property
    def best_model(self):
        return max(
            zip(self.all_models, self.all_classifiers),
            key=lambda z: z[0].accuracy(self.datapoints.values, z[1])
        )[0]


    def display(self):
        subplots = []
        for i, (model, classifier) in enumerate(zip(self.all_models, self.all_classifiers)):
            subplots.append((model.categories.train, model, model.history))
            # plot_decision_regions(model.datapoints.train, model.categories.train, model, errors=model.errors)
            # print(f"Squared error values over time: {model.errors}")
            acc = model.accuracy(self.datapoints.values, classifier)
            if model == self.best_model:
                print(f"Accuracy of winner OvR model [{i}]: {self.acc}")
            else:
                print(f"Accuracy of single OvR model [{i}]: {acc}")
        
        plot_multiple_decision_regions(self.all_models[0].datapoints.train, subplots)
        plt.show()



class MultiLayerTraining():
    def __init__(self, datapoints, categories, eta=0.001, dim_hidden=3):
        self.learning_rate = eta
        self.dim_hidden = dim_hidden
        self.X = datapoints
        self.t = categories
    
    def initialize(self, datapoints, categories):
        self.datapoints = datapoints
        self.categories = categories

        self.scale = self.get_scale(self.datapoints)

        self.dim_in = len(self.datapoints[0])
        self.dim_out = len(set(self.categories))
        print(f"Input sizes: {self.dim_in=}, {self.dim_out=}")

        rng = np.random.RandomState(2022)
        self.weights1 = np.random.uniform(-1, 1, size=(self.dim_in, self.dim_hidden))/np.sqrt(self.dim_in)
        self.weights2 = np.random.uniform(-1, 1, size=(self.dim_hidden, self.dim_out))/np.sqrt(self.dim_hidden)

        self.bias1 = np.zeros((1, self.dim_hidden))/np.sqrt(self.dim_in)
        self.bias2 = np.zeros((1, self.dim_out))/np.sqrt(self.dim_in)

        self.training_values = np.zeros((len(self.datapoints[:, 0]), self.dim_out))

        # initialize identity matrix
        for pos in range(self.dim_out):
            self.training_values[self.categories == pos] = [ int(i==pos) for i in range(self.dim_out) ]


    def fit(self, epochs=10000, report=100):
        print(f"Start accuracy: {self.acc}", "self.weights1:", self.weights1, "self.weights2:", self.weights2, sep="\n")

        print(f"Fit values: ", end="")
        for i in range(epochs):
            self.forward()
            self.backward()
            if (i % report) == 0:
                print(f"{self.acc}", end=" ")
        print()
        print(f"End fit values: {self.acc}", "self.weights1:", self.weights1, "self.weights2:", self.weights2, sep="\n")

    def forward(self, value=None):
        x = value if value is not None else self.datapoints
        self.hidden_activation = self.logistic((x @ self.weights1) + self.bias1)
        self.output_activation = self.logistic((self.hidden_activation @ self.weights2) + self.bias2)

    def backward(self, value=None):
        x = value if value is not None else self.datapoints

        temp = self.output_activation - self.training_values
        hidden_delta = self.logistic_derivative(self.hidden_activation) * (temp * self.training_values @ self.weights2.T)

        self.weights1 += self.learning_rate * (self.datapoints.T @ hidden_delta)
        self.bias1    += self.learning_rate * np.sum(hidden_delta, axis=0)

        output_delta = self.logistic_derivative(self.output_activation) * temp

        self.weights2 += self.learning_rate * (self.hidden_activation.T @ output_delta)
        self.bias2    += self.learning_rate * np.sum(output_delta, axis=0, keepdims=True)

    @property
    def acc(self):
        return self.accuracy()

    def accuracy(self, diff=0.00001, **kwargs):
        categories = [self.predict(val) for val in self.X.test]
        equal = len([(p, g) for p, g in zip(categories, self.t.values) if abs(p-g) < diff])
        return equal/len(self.t.values)

    def predict(self, train):
        self.forward(train)
        return self.output_activation.argmax()


    @staticmethod
    def logistic(x):
        return 1 / (1 + np.exp(-x))

    @staticmethod
    def logistic_derivative(x):
        return x * (1 - x)

    def get_scale(self, scale_for):
        from sklearn.preprocessing import MinMaxScaler
        scale = MinMaxScaler()
        categories_scale = scale.fit_transform(scale_for)
        # print(f"Scale of categories values: {categories_scale}")
        return categories_scale

    def test_dataset(self, X_dataset, t_dataset):
        remember = self.t
        scale = self.get_scale(X_dataset)
        print(f"Tested and got {self.acc}")
        self.t = remember


if __name__ == "__main__":
    # X are coordinates
    # t1 and t2 are two datasets for training
    datapoints, t1, t2 = generate_data()
    
    ## PART 1
    # Comparing two regression models
    for Model in (NumpyLinReg, NumpyLogReg):
        model = Model(datapoints, t2)
        model.run_model()
        model.display()

    # Running different classifiers by using the Logistic regression model
    one_vs_rest = NumpyOneVsRest(datapoints, t1)
    one_vs_rest.run_model()
    one_vs_rest.display()

    ## PART 2
    model = MultiLayerTraining(datapoints, t1)
    model.initialize(datapoints.train, t1.train)
    model.fit()

    model.test_dataset(datapoints.values, t1.values)

