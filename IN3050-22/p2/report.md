
### Mazunki Hoksaas
### 2022-04-19, IN3050

# Part 1: Linear Classifiers

## Linear regression
I've managed to solve this exercise, and can see the prediction matching the data by selecting a lower eta-value than the one I tried initially. Major changes per generations would make the loss sum value grow exponentially over time.

## Logistic regression
I'm not able to implement the cross entropy loss function properly, but by using the standard loss function it seems to work alright... I'm not sure what the CEL function would do different.

## One-vs-Rest regression
It seems like I'm able to get some results in the OvR model... although I don't see the accuracy of each classifier results matching the datapoints in the plot, but it seems reasonable that the second classifier is the winner.

# Part 2
I haven't changed this part.


# Part 3
As noted in the linear regression, using lower values causes the results to actually reach an asymptote, but choosing a too low value will prolong the training time a lot. I've tried tuning the values for the One-vs-Rest classifer, but I'm not sure I can trust the values I get.


