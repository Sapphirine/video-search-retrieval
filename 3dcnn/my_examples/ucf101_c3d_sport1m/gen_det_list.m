%

clear;

fout1 = fopen('list_ucf101_uniform16_prefix.lst','w'); 
fout2 = fopen('list_ucf101_uniform16.lst','w'); 
inputdir = '/vega/dvmm/projects/UCF101/UCF101_frm_uniform/';

folder = dir(inputdir); 

for folder_index = 3:size(folder,1)
    tic
    img = dir( [inputdir folder(folder_index).name '/'] );
    for img_index = 3:size(img,1)
		mkdir(['output_extract_test_empty/' folder(folder_index).name '/' img(img_index).name]);
		fprintf(fout1,['output_extract_test_empty/' folder(folder_index).name '/' img(img_index).name '/000001\n']);
		fprintf(fout2,[inputdir folder(folder_index).name '/' img(img_index).name '/ 1 0 1\n']);            
    end
    toc
end

fclose(fout1);
fclose(fout2);

