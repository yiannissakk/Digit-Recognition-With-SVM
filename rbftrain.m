function  [alpha, fval, exitflag]  = rbftrain( train_samples, train_labels, digit, C, sigma)

[height, width] = size(train_samples);
for n = 1 : height
    if train_labels(n) == digit
        train_labels(n) = 1;
    else
        train_labels(n) = -1;
    end 
end

gram = ones(height,height);
lambdas = train_samples;
for n=1:height
    for m=1:height
        gram(n,m) = exp(-((norm(lambdas(m,:)-lambdas(n,:))).^2/(2*sigma.^2)));
    end
end
gram = gram .* (train_labels*train_labels');


gram = gram + 1e-10*eye(size(gram));


aeq = train_labels';
beq = 0;

f = -ones(height,1);
x0 = zeros(height,1);

Lbound = zeros(height,1);
Ubound = C*ones(height,1);

[alpha, fval, exitflag] = quadprog(gram, f, [], [], aeq, beq, Lbound, Ubound, x0);
alpha = alpha.*train_labels;
end