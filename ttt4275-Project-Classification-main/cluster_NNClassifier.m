
function [predictedClassCluster] = cluster_NNClassifier(clusterTemplate, clusterClass, testv, num_test)

predictedClassCluster = zeros(num_test,1);

    for i = 1:num_test
        distances = dist(clusterTemplate,testv(i,:).'); % Compare every row in test set to the cluster set
        [~, index] = min(distances); % For each in chunk, find minimum element from each column
        prediction = clusterClass(index); % Gives us the predicted class based on the nearest neighbour 
        predictedClassCluster(i) = prediction;
        i
    end
end