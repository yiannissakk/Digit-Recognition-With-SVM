# Digit-Recognition-With-SVM

##Introduction
In this repository you will find the MNIST_data.mat file which includes two matrices test_samples, train samples and two vectors test_samples_labels, train_samples_labels. Each row in train_samples or test_samples is a sample of handwritten digit.  The vectors train_samples_labels and test_samples_labels give corresponding groundtruth labels, 0 to 9. train_samples_labels and train_samples will be used to train a support vector machine to recognize handwritten digits. The SVM will be tested on test_samples and its results will be compared to test_samples_labels. The SVM will be trained in two ways, and compared afterwards.
	
(Disclaimer: I am aware there exists an svmtrain method in matlab, however, this was part of an assignment wich forbid us from using it)
	
##Implementation

In the file rbftrain.m we build a quadratic programming problem that we will be minimizing in order to get the alpha coefficients which will be used in the testing phase. First, we need to find the Gram matrix. The function we will use to do that is the radial basis function also known as the Gaussian kernel function. Next, we need to account for the linear factor of the quadratic programming problem, thus we initialize a vector f which is made of -1's. Then, it is time to set our constraints which limit the linear factor into being larger than 0 but less than a constant C. Finally by using the quadprog function of Matlab we complete our coefficients that minimize our problem.

(We chose C=150 and our standard deviation to be 0.5 -was used in the gram matrix computation-)

Our next step is to take the coefficients found using rbftrain.m and use them to classify handwritten digits. That is done in rbf.classify which takes in as arguments the coefficients, a digit we want to classify and the two matrices train_samples (dataset we used for training) and test_samples(samples we wanna classify). It iterates over all test_samples and outputs 1 if the sample is the given digit and -1 otherwise.

Now, it is time to put everything we did in practise. That is going to be done using two techniques. The one-vs-all and the one-vs-one. The former is found in the rbfova.m file and runs the train and classify ten times each, once for every possible digit. The latter is found in the rbfovo.m and runs 45 pairs of digits and classify each sample as either one. Then each sample's final value is the one of the most occurring digit given from each of these 45 classifiers.


##Conclusion-Results

Finally in order to see which method is more efficient we create a simple error function in the rbferror.m file. It turns out one-vs-one has 99.6% efficiency whereas one-vs-all has 77.2%. The interesting part is that one-vs-one runs in almost 6 minutes whereas one-vs-all runs in around an hour.
