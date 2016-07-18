function [ classification ] = rbfclassify( test_data, train_data, alpha, digit)

[test_pop, test_features] = size(test_data);
[train_pop, train_features] = size(train_data);

classification = zeros(test_pop,1);
sigma = 0.5
for i = 1 : test_pop
    ker_mat = zeros(train_pop,1);
    for j = 1 : train_pop
        ker_mat(j) = exp(-((norm(test_data(i,:)-train_data(j,:))).^2/(2*sigma.^2)));
    end
    
    decision_f = 0;
    for j = 1  : train_pop
        decision_f = decision_f + alpha(j)*ker_mat(j);
    end
    if decision_f >= 1
        classification(i) = 1;
    else
        classification(i) = -1;
    end
end
end