
tic;
C = 150;
sigma = 0.5;

num_cases = 10;

vote_table = ones(length(test_samples_labels), (num_cases*(num_cases-1)/2));
vote_table = vote_table .* -1;
num_classifier = 0;

for digit1 = 0 : 8
    for digit2 = digit1 + 1 : 9
        
        num_classifier = num_classifier + 1;
        
        train_indx = find(train_samples_labels == digit1 | train_samples_labels == digit2);
        ovo_train_labels = train_samples_labels(train_indx);
        ovo_train_samples = train_samples(train_indx, :);
        [alpha, fval, exitflag] = rbftrain( ovo_train_samples, ovo_train_labels, digit1, C, sigma);
        
       
        test_indx = find(test_samples_labels == digit1 | test_samples_labels == digit2);
        ovo_test_lables = test_samples_labels(test_indx);
        ovo_test_samples = test_samples(test_indx, :);
        output = rbfclassify( ovo_test_samples, ovo_train_samples, alpha, digit1);
        
        
        for i = 1 : length(output)
            if output(i) == 1
                output(i) = digit1;
            else
                output(i) = digit2;
            end
        end
        
        
        for i = 1 : length(output)
            vote_table(test_indx(i), num_classifier) = output(i);
        end
    end
end


ovo_output = ones(length(test_samples_labels),1);
ovo_output = ovo_output .* -1;

for i = 1 : length(vote_table)
    vector_votes = vote_table(i,:);
    bad_indx = find(vector_votes == -1);
    vector_votes(bad_indx) = [];
    ovo_output(i) = mode(vector_votes,2);
end
toc;