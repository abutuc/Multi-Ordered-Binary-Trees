clc
close all
clear

filename = "tree_depth.txt";
f = fopen(filename);
target = 100000;

tempos0 = zeros(1, 100);
count0 = 1;

tempos1 = zeros(1, 100);
count1 = 1;

tempos2 = zeros(1, 100);
count2 = 1;

tempos3 = zeros(1, 100);
count3 = 1;

while 1
    tline = fgetl(f);
    if ~ischar(tline), break, end
    data = split(tline);
    if (str2double(data{1,1}) == target)
        index = str2double(data{2,1});
        tempo = round(str2double(data{4,1}),3);
        
        if index == 0
            tempos0(count0) = tempo;
            count0 = count0 + 1;
        elseif index == 1
            tempos1(count1) = tempo;
            count1 = count1 + 1;
        elseif index == 2
            tempos2(count2) = tempo;
            count2 = count2 + 1;
        elseif index == 3
            tempos3(count3) = tempo;
            count3 = count3 + 1;
        end
    end
end

histogram(tempos0, 150, "Facecolor", "#FFA500")
hold on
histogram(tempos1, 150, "Facecolor", "g")
histogram(tempos2, 150, "Facecolor", "b")
histogram(tempos3, 150, "Facecolor", "red")
hold off
title("Tree Depth Calculation Time 100 Experiments of 100000 People")
xlabel("Execution Time")
ylabel("Number of Occurrences")
legend("index 0", "index 1", "index 2", "index 3")
fclose(f);
