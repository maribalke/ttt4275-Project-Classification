
function [predictedClassCluster] = cluster_NNClassifier(clusterTemplate, clusterClass, testv, num_test)

predictedClassCluster = zeros(num_test,1);

    for i = 1:num_test
        distances = dist(clusterTemplate,testv(i,:).'); % compare every row in test set to the cluster set
        [~, index] = min(distances); % for each in chunk, find minimum element from each column
         
        pred = clusterClass(index); % gives us the predicted class based on the nearest neighbour (index)
        predictedClassCluster(i) = pred;
        i
    end
end