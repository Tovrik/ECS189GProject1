
function energyImage = energy_image( im )
    %calculate grayscale image
    grayscale = double(rgb2gray(im));

    %define Sobel filters
    SobelX = [-1 0 1; -2 0 2; -1 0 1];
    SobelY = [-1 -2 -1; 0 0 0; 1 2 1];

    %calculate the partial derivatives
    partialX = conv2(grayscale, SobelX, 'same');
    partialY = conv2(grayscale, SobelY, 'same');

    %calculate energy map
    energyImage = sqrt((partialX.^2) + (partialY.^2));
end


