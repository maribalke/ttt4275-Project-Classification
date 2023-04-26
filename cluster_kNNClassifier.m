
function [predictedClass] = cluster_kNNClassifier(k, clusterTemplate, clusterClass, testv, num_test)

predictedClass = zeros(num_test, 1);


    for i = 1:num_test
        distances = dist(clusterTemplate,testv(i,:).'); % compare every row in test set to the cluster set
        [~, index] = mink(distances, k); % for each in chunk, find minimum element from each column
        [pred, ~, C] = mode(clusterClass(index));
       
        if ~isempty(C)
            for l = 1:k
                clusterClass(index(l))
                
        
                if any(clusterClass(index(l)) == C{1,1}) 
              
                    pred = clusterClass(index(l));
                    break
                end

            
            end
        
        end
       
        predictedClass(i) = pred;
        i
    end
end