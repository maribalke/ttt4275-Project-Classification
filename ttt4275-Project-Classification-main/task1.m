%% Task 1a - Nearest neighbor using Eucledian distance

load("data_all.mat");
load("chunk1_predictedClass.mat");
load("chunk2_predictedClass.mat");
load("chunk3_predictedClass.mat");

% Initialization
numClasses = 10; 
chunkSize = 1000; 
numChunks = num_test/chunkSize; 

%% Classifying three first chuncks of data

% classes1 = NN_Classifier(trainv,testv(1:chunkSize,:),num_test,chunkSize,trainlab);
% save('chunk1_predictedClass.mat', classes1);

% classes2 = NN_Classifier(trainv,testv(chunkSize+1:2*chunkSize,:),num_test,chunkSize,trainlab);
% save('chunk2_predictedClass.mat', classes2);

% classes3 = NN_Classifier(trainv,testv(2*chunkSize+1:3*chunkSize,:),num_test,chunkSize,trainlab);
% save('chunk3_predictedClass.mat', classes3);


%% Confusion Matrix and Error Rate

confusionMatrix = confusionchart(testlab(1:1000),classes1);
confusionMatrix.labels = {0,1,2,3,4,5,6,7,8,9};

errorRate1 = 1- trace(confusionMatrix1)/chunkSize;
errorRate2 = 1- trace(confusionMatrix2)/chunkSize;
errorRate3 = 1- trace(confusionMatrix3)/chunkSize;

%% Task 1b - Plot of misclassified pictures

failures = zeros(chunkSize,1);

for i = 1:chunkSize
    failures(i) = classes1(i) - testlab(i);
end

fig3 = figure(3);
convertingToPicture1 = zeros(28,28);
convertingToPicture1(:) = testv(242,:); % guess = 8, acutal = 9
subplot(2,2,1);
image(convertingToPicture1');
title("Classified as 8, actually 9", 'interpreter', 'latex')

convertingToPicture2 = zeros(28,28);
convertingToPicture2(:) = testv(116,:); % guess = 9, acutal = 4
subplot(2,2,2);
image(convertingToPicture2');
title("Classified as 9, actually 4", 'interpreter', 'latex')

convertingToPicture3 = zeros(28,28);
convertingToPicture3(:) = testv(269,:); % guess = 5, acutal = 8
subplot(2,2,3);
image(convertingToPicture3');
title("Classified as 5, actually 8", 'interpreter', 'latex')

convertingToPicture4 = zeros(28,28);
convertingToPicture4(:) = testv(321,:); % guess = 7, acutal = 9
subplot(2,2,4);
image(convertingToPicture4');
title("Classified as 7, actually 9", 'interpreter', 'latex')

%tit = sprintf('Plot of incorrectly classified pictures');
%sgtitle(tit, 'interpreter', 'latex');
grid on
dims = [200 200 500 300];
set(fig3, 'renderer', 'painters', 'position', dims, 'PaperPositionMode', 'auto');
print('-dpng', '-r600', '/Users/bruker/Desktop/ttt4275-Estimering/MNist_ttt4275/figures/task1/b_incorreclyClassified');

%% Task 1c - Plot of correctly classified pictures

fig4 = figure(4);
convertingToPicture1 = zeros(28,28);
convertingToPicture1(:) = testv(1,:); 
subplot(2,2,1);
image(convertingToPicture1');

convertingToPicture2 = zeros(28,28);
convertingToPicture2(:) = testv(2,:); 
subplot(2,2,2);
image(convertingToPicture2');

convertingToPicture3 = zeros(28,28);
convertingToPicture3(:) = testv(3,:);
subplot(2,2,3);
image(convertingToPicture3');

convertingToPicture4 = zeros(28,28);
convertingToPicture4(:) = testv(4,:);
subplot(2,2,4);
image(convertingToPicture4');


%tit = sprintf('Plot of correctly classified pictures');
%sgtitle(tit, 'interpreter', 'latex');
grid on
dims = [200 200 500 300];
set(fig4, 'renderer', 'painters', 'position', dims, 'PaperPositionMode', 'auto');
print('-dpng', '-r600', '/Users/bruker/Desktop/ttt4275-Estimering/MNist_ttt4275/figures/task1/b_correclyClassified');


