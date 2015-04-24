function [ reducedColorImage, reducedEnergyImage ] = reduce_height( im, energyImage )
   % get the size of the image
    [x,y,~] = size(im);
    % get the horizontal energy map 
    cumulativeEnergyMapHorizontal = cumulative_minimum_energy_map(energyImage, 'HORIZONTAL');
    % get the horizontal seam
    horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMapHorizontal);    
    % initialize the outputs
    reducedColorImage = [];
    reducedEnergyImage = [];
    
    for i = 1:y
        % get the index of the value to delete
        temp = horizontalSeam(y-i+1);
        % generate the color image col without that pixel
        colIm = [im(1:temp-1, i, 1:3); im(temp+1:x, i, 1:3)];
        %generate the energy image col without that pixel
        colEi = [energyImage(1:temp-1, i); energyImage(temp+1:x, i)];
        
        %add the cols to the outputs
        reducedColorImage = [reducedColorImage colIm];
        reducedEnergyImage = [reducedEnergyImage colEi];
    end


end

