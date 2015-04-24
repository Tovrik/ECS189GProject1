function cumulativeEnergyMap = cumulative_minimum_energy_map( energyImage, seamDirection )
    % dimensions of input image
    [x,y] = size(energyImage);
    % for horizontal     
    if(strcmp(seamDirection, 'HORIZONTAL'))
        for j = 2:y
            energyImage(:,j) = energyImage(:,j) + imerode(energyImage(:,j-1), [1; 1; 1]);   
        end
    end   
    %for vertical
    if(strcmp(seamDirection,'VERTICAL'))
        for i = 2:x
            energyImage(i,:) = energyImage(i,:) + imerode(energyImage(i-1,:), [1 1 1]);
        end
    end
    % set output
    cumulativeEnergyMap = energyImage;
end

