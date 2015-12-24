clc,clear;

load('ucf101_c3d_fc7.mat');
load('ucf101_c3d_fc7_label.mat');
N = size(prob, 1);
original_prob = prob;
original_Label = Label;
%Center and normalize data
%col_mean = mean(prob);
%prob = prob - repmat(col_mean, N, 1);

for i = 1 : N
    %Using l-2 norm
    prob(i,:) = prob(i,:) ./ norm(prob(i,:), 2);
end


% shuffle the data
R = randperm(N);
prob = prob(R,:);
Label = Label(R, :);

% get training and testing data
Test_X = prob(1:1000, :);
Test_Y = Label(1:1000, :);
Train_X = prob(1001:end, :);
Train_Y = Label(1001:end, :);

%Initialize the lsh
Nbits = 256;
Dim = size(prob, 2);
W = randn(Dim, Nbits);

U_Train = Train_X * W > 0;
U_Test = Test_X * W > 0;


%set the query item
%N_test = size(U_Test, 1);
N_test = 100;
N_res = 6;
res_verbose = cell(N_test, 1);
res_accuracy = zeros(N_test, 1);

disp('starts query')
for i = 1 : N_test
    disp(i);
    Idx =i;
    U_item = U_Test(Idx, :);
    query_original_idx = R(Idx);
    
    %calculate the distance
    dist = sum(bitxor(U_Train, repmat(U_item, size(U_Train, 1), 1)), 2);
    
    [B, I] = sort(dist);
    
    %compare the result
    
    res_original_idx = R(1000 + I(1:N_res, 1));
    res_Y = Train_Y(I(1:N_res, 1), 1);
    
    N_correct = sum(Test_Y(Idx, 1) == res_Y);
    
    accuracy = N_correct / N_res;
    
    res_verbose{i}.Label = Test_Y(Idx, 1);
    res_verbose{i}.query_original_idx = query_original_idx;
    res_verbose{i}.res_original_idx =  res_original_idx;
    res_verbose{i}.res_Y =  res_Y;
    res_verbose{i}.accuracy =  accuracy;
    res_accuracy(i) = accuracy;
end
  


for i  = 1 : N_test
    if  res_accuracy(i) > 0.8
        disp([num2str(res_verbose{i}.query_original_idx) ', ' num2str(res_verbose{i}.Label)  ', ' num2str(res_verbose{i}.res_original_idx) ', ' num2str(res_verbose{i}.accuracy)])
    end
end














