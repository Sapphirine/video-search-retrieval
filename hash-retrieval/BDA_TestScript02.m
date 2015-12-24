% get accuracy for some classes

N_res = 25;
classes = 1:101;
avg_precision = zeros(size(classes));

for i = 1 : size(classes, 2)
    disp(i)
    classIdx = classes(i);
    
    class_items = find(Test_Y == classIdx);
    
    %disp([i size(class_items, 1)])
    total_p = 0;
    for j  = 1 : size(class_items, 1)
        %for each item in the test set with classIdx
        Idx = class_items(j);
        U_item = U_Test(Idx, :);

        %calculate the distance
        dist = sum(bitxor(U_Train, repmat(U_item, size(U_Train, 1), 1)), 2);    
        [B, I] = sort(dist);
        
        %compare the result
        res_Y = Train_Y(I(1:N_res, 1), 1);     
        N_correct = sum(Test_Y(Idx, 1) == res_Y);
        
         total_p =  total_p  + N_correct / N_res;
       
    end
    avg_precision(i) = total_p / size(class_items, 1);
end


mean(avg_precision)









