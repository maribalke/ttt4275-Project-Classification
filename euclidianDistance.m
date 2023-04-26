function[distance] = euclidianDistance(train_set,test_set)
    [m,n] = size(train_set);
    [p,q] = size(test_set);

    if n ~= q
        error('The number of columns in the two matrices must be the same');
    end
    
    distance = zeros(m,p);

    for i = 1:m
        for j = 1:p
            distance(i,j) = norm(train_set(i,:) - test_set(j,:));
        end
    end
end