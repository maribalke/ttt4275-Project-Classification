
function [predictedClass] = cluster_kNNClassifier(k, clusterTemplate, clusterClass, testv, num_test)

predictedClass = zeros(num_test, 1);

    for i = 1:num_test
        distances = dist(clusterTemplate,testv(i,:).'); % Compare every row in test set to the cluster set
        [~, index] = mink(distances, k); % For each in chunk, find k shortest distances
        [prediction, ~, C] = mode(clusterClass(index)); % Sorting the classes of the k shortest distances, based on distance
       
        if ~isempty(C) % C is not empty if several classes appears equally frequent, must find the closest cluster
            for l = 1:k
                if any(clusterClass(index(l)) == C{1,1}) % Selecting the closest cluster, by going through sorted list
                    prediction = clusterClass(index(l)); % Finding class of the chosen cluster
                    break
                end
            end
        end
        predictedClass(i) = prediction; % Returns predicted classes for the test set
        i
    end
end