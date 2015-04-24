function [ ] = display_seam( im, seam, seamDirection )
    % dimensions of input image
    [x,y,z] = size(im);
    % for horizontal     
    if(strcmp(seamDirection, 'HORIZONTAL'))
        for j = 1:y
            im(seam(y-j+1), j, 1) = 255;
            im(seam(y-j+1), j, 2:3) = 0;
        end
    end   
    %for vertical
    if(strcmp(seamDirection,'VERTICAL'))
        for i = 1:x
            im(i, seam(x-i+1), 1) = 255;
            im(i, seam(x-i+1), 2:3) = 0;
        end
    end
    imagesc(im);
end

