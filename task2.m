
load("data_all.mat")
load("clusterClass.mat")
load("clusterTemplate.mat")
load("k_clusterClass.mat")

numClasses = 10;

%tic
%classByClustering = cluster_NNClassifier(clusterTemplate, clusterClass, testv, num_test);
%toc

confusionMatrixCluster = zeros(numClasses);

for i = 1:num_test
   confusionMatrixCluster(classByClustering(i)+ 1, testlab(i)+ 1) = confusionMatrixCluster(classByClustering(i)+ 1, testlab(i)+ 1) + 1;
end
confusionchart(confusionMatrixCluster)

errorRateCluster = 1 - trace(confusionMatrixCluster)/num_test;

%% task 2c
k = 7;

% tic
% classByClustering_k = cluster_kNNClassifier(k, clusterTemplate, clusterClass, testv, num_test);
% toc

k_confusionMatrixCluster = zeros(numClasses);

for i = 1:num_test
   k_confusionMatrixCluster(classByClustering_k(i)+ 1, testlab(i)+ 1) = k_confusionMatrixCluster(classByClustering_k(i)+ 1, testlab(i)+ 1) + 1;
end
confusionchart(k_confusionMatrixCluster)

k_errorRateCluster = 1 - trace(k_confusionMatrixCluster)/num_test;

