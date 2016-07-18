result = unique(vec);
actual = unique(test_samples_labels);
freqtest = histc(vec,result);
freqact = histc(test_samples_labels, actual);
diffova=0;
for jk=1:1000
    if vec(jk) ~= test_samples_labels(jk);
        diffova = diffova+1;
    end
end
diffova =1-diffova/1000;

result = unique(ovo_output);
actual = unique(test_samples_labels);
freqtest = histc(vec,result);
freqact = histc(test_samples_labels, actual);
diffovo=0;
for jk=1:1000
    if ovo_output(jk) ~= test_samples_labels(jk);
        diffovo = diffovo+1;
    end
end
diffovo =1-diffovo/1000;