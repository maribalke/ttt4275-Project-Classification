
%% task 2 - clustering

load("data_all.mat");

M = 64;
numClasses = 10;

clusterTemplate = zeros(M*numClasses, vec_size); % vector cointaining all clusters of each class, 640x784
clusterClass = zeros(M*10, 1); % vector containing the corresponding class to each cluster

tic

for i = 0:numClasses-1
    train_i = trainv(trainlab == i, :); % select only the rows in trainV that corresponds to class i
    [~, Cluster_i] = kmeans(train_i, M);
    clusterTemplate(i*M+1:M*(i+1),:) = Cluster_i;
    clusterClass(i*M+1:M*(i+1)) = i*ones(M, 1);
    i
end
toc