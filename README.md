# Digit-Recognition-With-SVM

##Introduction
In this repository you will find the MNIST_data.mat file which includes two matrices test_samples, train samples and two vectors test_samples_labels, train_samples_labels. Each row in train_samples or test_samples is a sample of handwritten digit.  The vectors train_samples_labels and test_samples_labels give corresponding groundtruth labels, 0 to 9. train_samples_labels and train_samples will be used to train a support vector machine to recognize handwritten digits. The SVM will be tested on test_samples and its results will be compared to test_samples_labels. The SVM will be trained in two ways, and compared afterwards.
	
(Disclaimer: I am aware there exists an svmtrain method in matlab, however, this was part of an assignment wich forbid us from using it)
	
##Implementation

In the file rbftrain.m we create the training function that we will be using in order to compute the Gram matrix. The function we will use is the radial basis function also known as the Gaussian kernel function

##Conclusion-Results
