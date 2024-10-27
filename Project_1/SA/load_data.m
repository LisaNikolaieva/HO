function [E,C]= load_data(file)
% Open the file
% file = 'inst_50_4_00001';
fileID = fopen(file, 'r'); % replace 'data.txt' with the actual file name

% Skip the header lines
fgetl(fileID); % Skip '1:56:1025'
fgetl(fileID); % Skip '#constraints'

% Read constraints
C = [];
while true
    line = strtrim(fgetl(fileID)); % Read the next line and trim whitespace
    if startsWith(line, '#edges') % Stop at '#edges'
        break;
    end
    C = [C; str2num(line)]; %#ok<*ST2NM> % Convert the line to numbers and add to C
end

% Read edges
E = [];
while ~feof(fileID)
    line = strtrim(fgetl(fileID));
    if ~isempty(line)
        E = [E; str2num(line)]; % Convert the line to numbers and add to E
    end
end

% Close the file
fclose(fileID);

% Display the results
disp('Constraints (C):');
disp(C);
disp('Edges (E):');
disp(E);


writematrix(C, 'C.txt');
writematrix(E, 'E.txt');

end