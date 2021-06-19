function listaFilme = incarcaDateFilme()

% Fisierul movie.txt contine o lista cu n = 1682 filme
% Functia incarcaDateFilme va construi un vector coloana cu aceste filme,
% pe care il va returna

fileID = fopen('movie_ids.txt');
n = 1682;

% Stocam toate fileme in cell array ul listaFilme{}
listaFilme = cell(n, 1);

% In fisierul movie.txt, lista cu contine titluri de filme precum:
% 866 Michael (1996)
% Pentru a stoca doar numele fimului si anul, va trebui sa eliminam indexul
% acestuia folosind strtok, iar apoi sa eliminam spatiile ramase intre
% index si nume

for i = 1:n
    line = fgets(fileID);
    [idx, movieName] = strtok(line, ' ');
    listaFilme{i} = strtrim(movieName);
end

fclose(fileID);

end
