function [ reducedColorImage, reducedEnergyImage ] = reduce_width( im, energyImage )
    % get the size of the image
    [x,y,~] = size(im);
    % get the vertical energy map 
    cumulativeEnergyMapVertical = cumulative_minimum_energy_map(energyImage, 'VERTICAL');
    % get the vertical seam
    verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMapVertical);    
    % initialize the outputs
    reducedColorImage = [];
    reducedEnergyImage = [];
    
    for i = 1:x
        % get the index of the value to delete
        temp = verticalSeam(x-i+1);
        % generate the color image row without that pixel
        rowIm = [im(i, 1:temp-1, 1:3) im(i, temp+1:y, 1:3)];
        %generate the energy image row without that pixel
        rowEi = [energyImage(i, 1:temp-1) energyImage(i, temp+1:y)];
        
        %add the rows to the outputs
        reducedColorImage = [reducedColorImage; rowIm];
        reducedEnergyImage = [reducedEnergyImage; rowEi];
    end
end

