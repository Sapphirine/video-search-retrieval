clear;
%
inputdir = '../output_c3d_sport1m/';

folder = dir(inputdir); 

prob = zeros(13320,4096);

count = 0;
for folder_index = 3:size(folder,1)
    tic
    folder_index
    img = dir( [inputdir folder(folder_index).name '/'] );
    for img_index = 3:size(img,1)
        count = count + 1;
        [~,prob(count,:)] = read_binary_blob([inputdir folder(folder_index).name '/' img(img_index).name '/000001.fc7-1']);
    end
    toc
end

save('read_res.mat','prob');