%% Task 2 - k nearest neighbors

load("data_all.mat")
load("clusterClass.mat")
load("clusterTemplate.mat")
load("k_clusterClass.mat")

% Initialization
numClasses = 10;
M = 64;

% 2a) Clustering using NN

clusterTemplate = zeros(M*numClasses, vec_size); % vector cointaining all clusters of each class, 640x784
clusterClass = zeros(M*10, 1); % vector containing the corresponding class to each cluster

tic
for i = 0:numClasses-1
    train_i = trainv(trainlab == i, :); % Select only the rows in trainv that corresponds to class i
    [~, Cluster_i] = kmeans(train_i, M); % Creating clusters for each class
    clusterTemplate(i*M+1:M*(i+1),:) = Cluster_i; % Adding clusters of the class
    clusterClass(i*M+1:M*(i+1)) = i*ones(M, 1); % Adding corresponding class of the cluster
    i
end
toc

% Classifying the test set

%tic
%classByClustering = cluster_NNClassifier(clusterTemplate, clusterClass, testv, num_test);
%toc

%% 2b) Confusion matrix and error rate

confusionMatrixCluster = confusionchart(testlab,classByClustering);
confusionMatrixCluster.labels = {0,1,2,3,4,5,6,7,8,9};

errorRateCluster = 1 - trace(confusionMatrixCluster)/num_test;

%% 2c) kNN

k = 7; % Number of nearest neighbors

% Classifying 
% tic
% classByClustering_k = cluster_kNNClassifier(k, clusterTemplate, clusterClass, testv, num_test);
% toc

% Confusion matrix
plotmatrix = confusionchart(testlab,classByClustering_k);
plotmatrix.labels = {0,1,2,3,4,5,6,7,8,9};

% Error rate
k_errorRateCluster = 1 - trace(k_confusionMatrixCluster)/num_test;
