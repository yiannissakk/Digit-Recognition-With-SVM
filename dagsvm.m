alphas = {};
ovo_trains = {};

for digit1 = 0 : 8
    for digit2 = digit1 + 1 : 9
        num_classifier = num_classifier + 1;
        
        train_indx = find(train_samples_labels == digit1 | train_samples_labels == digit2);
        ovo_train_labels = train_samples_labels(train_indx);
        ovo_train_samples = train_samples(train_indx, :);
        [alpha, fval, exitflag] = rbftrain( ovo_train_samples, ovo_train_labels, digit1, C, sigma);
        alphas = [alphas, alpha];
        test_indx = find(test_samples_labels == digit1 | test_samples_labels == digit2);
        ovo_test_lables = test_samples_labels(test_indx);
        ovo_test_samples = test_samples(test_indx, :);
        output = rbfclassify( ovo_test_samples, ovo_train_samples, alpha, digit1);
        ovo_trains = [ovo_trains, ovo_train_samples];
        for i = 1 : length(output)
            if output(i) == 1
                output(i) = digit1;
            else
                output(i) = digit2;
            end
        end
        
    end
end
DAGSVM_labels = {}
for sample = test_smaples
    labels = [0:9];
    for i = 1:10
        index = ((9 - min(labels)) + 9) * (min(labels) + 1) / 2 - (10 - min(labels)) + (max(labels) - min(labels));
        output = rbfclassify(sample, ovo_train_samples{index}, alpha{index}, min(labels));
        if output(1) == 1
            labels = labels(1:end - 1);
        else
            labels = labels(2:end);
        end
    end
    DAGSVM_labels = [DAGSVM_labels, labels{1}];
end