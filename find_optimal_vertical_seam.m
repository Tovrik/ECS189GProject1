
function [ verticalSeam ] = find_optimal_vertical_seam(cumulativeEnergyMap)
    % dimensions of matrix
    [n,m] = size(cumulativeEnergyMap);
    % coordinates of min value on bottom row
    [~,x] = min(cumulativeEnergyMap(n,:));
    % intialize verticalSeam
    verticalSeam = [x];
    tempX = x;
    %for loop starting at bottom row and moving upwards
    for i = n:-1:2
        %find which of three above values it is
        if tempX == 1
            [~,x] = min([9999999, cumulativeEnergyMap(i-1, tempX), cumulativeEnergyMap(i-1, tempX+1)]);
        elseif tempX == m
            [~,x] = min([cumulativeEnergyMap(i-1, tempX-1), cumulativeEnergyMap(i-1, tempX), 9999999]);
        else
            [~,x] = min([cumulativeEnergyMap(i-1, tempX-1), cumulativeEnergyMap(i-1, tempX), cumulativeEnergyMap(i-1, tempX+1)]);
        end
        
        % change x according to which value it was and append that
        if x == 1
            tempX = tempX - 1;
        elseif x == 3
            tempX = tempX + 1;
        end
        verticalSeam = [verticalSeam, tempX];
    end    
end

