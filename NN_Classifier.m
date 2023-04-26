function [predictedClass] = NN_Classifier(trainv,testv,num_tests,chunk_size,trainlab)

predictedClass = zeros(num_tests,1);

    for i = 1:chunk_size
        distances = dist(trainv,testv(i,:).'); % compare every row in test set to the whole training set
        [~, index_in_chunk] = min(distances); % for each in chunk, find minimum element from each column
        pred = trainlab(index_in_chunk); % gives us the predicted class based on the nearest neighbour (index)
        predictedClass(i) = pred;
        i
    end
end