function [predictedClass] = NN_Classifier(train_set,test_set,num_tests,chunk_size,num_chunks,train_lab)

NN_distances = zeros(num_tests, num_chunks);
NN_indices = zeros(num_tests, num_chunks);

for i = 1:num_chunks % for ant chunks (60)
    currentChunk = train_set((i-1)*chunk_size+1:i*chunk_size,:); % plukker ut gjeldende chunk fra training settet (rad,kolonne)
    distances = euclidianDistance(currentChunk,test_set); % beregner euclidian avstand mellom alt i chunken til alt i testsettet (1000*10000 matrise)
    %distances = dist(currentChunk,test_set');
    
    for j = 1:num_tests % for hver instans i testsettet 
        [NN_dist_in_chunk, index_in_chunk] = min(distances(:,j)); % finner nn for hver instans i den chunken
        NN_distances(j,i) = NN_dist_in_chunk; % lagrer avstand og index for nn lokalt i en chunk
        NN_indices(j,i) = (i-1)*chunk_size + index_in_chunk;
        %print('new chunk');
    end
end

predictedClass = zeros(num_tests,1);

for i = 1:num_tests % for hver instans i testsettet
    [glob_NN_dist, glob_NN_index] = min(NN_distances(i,:)); % finner kortese avstand totalt
    predictedClass(i) = train_lab(NN_indices(i, glob_NN_index)); % lagrer den korteste avstanden fra riktig indeks i classes av instansen
end
end