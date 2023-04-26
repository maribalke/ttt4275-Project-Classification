%% Task 1a - Nearest Neighbor using Eucledian distance

tic

load("data_all.mat")

% Initialization
numClasses = 10; 
chunkSize = 1000; 
numChunks = num_test/chunkSize; % 10 stk
% eller numChunks = num_train/chunkSize;


% Classifying 3 chuncks of data

% classes1 = NN__Classifier(trainv,testv(1:chunkSize,:),num_test,chunkSize,trainlab);
% %save('chunk1_predictedClass.mat', classes1);
% classes2 = NN__Classifier(trainv,testv(chunkSize+1:2*chunkSize,:),num_test,chunkSize,trainlab);
% %save('chunk2_predictedClass.mat', classes2);
%classes3 = NN__Classifier(trainv,testv(2*chunkSize+1:3*chunkSize,:),num_test,chunkSize,trainlab);
% %save('chunk3_predictedClass.mat', classes3);


% Confusion matrix
confusionMatrix1 = zeros(numClasses);
confusionMatrix2 = zeros(numClasses);
confusionMatrix3 = zeros(numClasses);

% The diagonal will be incremented each time we classified correctly
for i = 1:chunkSize
   confusionMatrix1(classes1(i)+ 1, testlab(i)+ 1) = confusionMatrix1(classes1(i)+ 1, testlab(i)+ 1) + 1;
end
for i = 1:chunkSize
   confusionMatrix2(classes2(i)+ 1, testlab(chunkSize+i)+ 1) = confusionMatrix2(classes2(i)+ 1, testlab(chunkSize+i,:)+ 1) + 1;
end
for i = 1:chunkSize
   confusionMatrix3(classes3(i)+ 1, testlab(2*chunkSize + i)+ 1) = confusionMatrix3(classes3(i)+ 1, testlab(2*chunkSize + i)+ 1) + 1;
end


% error rate
errorRate1 = 1- trace(confusionMatrix1)/chunkSize;
errorRate2 = 1- trace(confusionMatrix2)/chunkSize;
errorRate3 = 1- trace(confusionMatrix3)/chunkSize;
toc

%% Task 1b - Plot of misclassified pictures

failures = zeros(chunkSize,1);

for i = 1:chunkSize
    failures(i) = classes1(i) - testlab(i);
end

convertingToPicture1 = zeros(28,28);
convertingToPicture1(:) = testv(242,:); % guess = 8, acutal = 9
subplot(2,2,1);
image(convertingToPicture1');

convertingToPicture2 = zeros(28,28);
convertingToPicture2(:) = testv(116,:); % guess = 9, acutal = 4
subplot(2,2,2);
image(convertingToPicture2');

convertingToPicture3 = zeros(28,28);
convertingToPicture3(:) = testv(269,:); % guess = 5, acutal = 8
subplot(2,2,3);
image(convertingToPicture3');

convertingToPicture4 = zeros(28,28);
convertingToPicture4(:) = testv(321,:); % guess = 7, acutal = 9
subplot(2,2,4);
image(convertingToPicture4');
%% Task 1c - Plot of correctly classified pictures

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
