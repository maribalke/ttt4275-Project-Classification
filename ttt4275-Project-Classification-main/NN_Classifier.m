function [predictedClass] = NN_Classifier(trainv,chunkInTestv,chunkSize,trainlab)

predictedClass = zeros(chunkSize,1);

    for i = 1:chunkSize
        distances = dist(trainv,chunkInTestv(i,:).'); % Comparing every row in test set to the whole training set
        [~, index_in_chunk] = min(distances); % For each chunk, find minimum distance for all test instances
        prediction = trainlab(index_in_chunk); % Gives us the predicted class based on the nearest neighbour
        predictedClass(i) = prediction; % Returns predicted class for the test set
        i
    end
end