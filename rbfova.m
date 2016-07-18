vec = ones(1000,1);
vec2 = ones(1000,1);
for n=0:9
    if n==0
        [a,b,c]=rbftrain(train_samples, train_samples_labels, n, 150,0.5);
        vec = rbfclassify(test_samples, train_samples, a, n);
        for p=1:100
            if vec(p)==1
                vec(p)=0;
            end
        end
    else
        [a,b,c]=rbftrain(train_samples, train_samples_labels, n, 150,0.5);
        vec2 = rbfclassify(test_samples, train_samples, a, n);
        for l=1:1000
            if (vec(l)==-1) && (vec2(l)==1);
                vec(l)=n;
            end
        end
    end
end
                 