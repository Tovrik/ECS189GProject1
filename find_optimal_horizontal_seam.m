function [ horizontalSeam ] = find_optimal_horizontal_seam( cumulativeEnergyMap )
    % dimensions of matrix
    [n,m] = size(cumulativeEnergyMap);
    % coordinates of min value on bottom row
    [~,y] = min(cumulativeEnergyMap(:,m));
    % intialize horizontalSeam
    horizontalSeam = [y];
    tempY = y;
    %for loop starting at bottom row and moving upwards
    for i = m:-1:2
        %find which of three above values it is
        if tempY == 1
            [~,y] = min([9999999, cumulativeEnergyMap(tempY, i-1), cumulativeEnergyMap(tempY+1,i-1)]);
        elseif tempY == n
            [~,y] = min([cumulativeEnergyMap(tempY-1,i-1), cumulativeEnergyMap(tempY,i-1), 9999999]);
        else
            [~,y] = min([cumulativeEnergyMap(tempY-1,i-1), cumulativeEnergyMap(tempY,i-1), cumulativeEnergyMap(tempY+1,i-1)]);
        end
        
        % change x according to which value it was and append that
        if y == 1
            tempY = tempY - 1;
        elseif y == 3
            tempY = tempY + 1;
        end
        horizontalSeam = [horizontalSeam, tempY];
    end   
end

