function [Y,R] = loadDataset(datasetName)
    fileID = fopen(datasetName);
    Y = zeros(1682,943);
    R = zeros(1682,943);
    while ~feof(fileID)
        line = fgets(fileID);
        c = strsplit(line,'	');
        ID_user = str2double(strtrim(c{1}));
        ID_movie = str2double(strtrim(c{2}));
        rating = str2double(strtrim(c{3}));

        Y(ID_movie, ID_user) = rating;
        R(ID_movie, ID_user) = 1;
    end
    fclose(fileID);
end

