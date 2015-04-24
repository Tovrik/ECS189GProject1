testImage = imread('inputSeamCarvingPrague.jpg');

%print original image
subplot (5,2,1)
imagesc(testImage)
title('Original Image')

%print energyImage
myEnergyImage = energy_image(testImage);
subplot(5,2,2)
imagesc(myEnergyImage);
title('Energy Map')

%print myCumulitiveEnergyMap
myCumulativeEnergyMapVertical = cumulative_minimum_energy_map(myEnergyImage, 'VERTICAL');
subplot(5,2,3)
imagesc(myCumulativeEnergyMapVertical);
title('Vertical Energy Map')

%print myVerticalSeam
myVerticalSeam = find_optimal_vertical_seam(myCumulativeEnergyMapVertical);
subplot(5,2,4)
display_seam(testImage, myVerticalSeam, 'VERTICAL');
title('Vertical Seam')

%print myCumulitiveEnergyMap
myCumulativeEnergyMapHorizontal = cumulative_minimum_energy_map(myEnergyImage, 'HORIZONTAL');
subplot(5,2,5)
imagesc(myCumulativeEnergyMapHorizontal);
title('Horizontal Energy Map')

%print myVerticalSeam
myHorizontalSeam = find_optimal_horizontal_seam(myCumulativeEnergyMapHorizontal);
subplot(5,2,6)
display_seam(testImage, myHorizontalSeam, 'HORIZONTAL');
title('Horizontal Seam')

%print Reduce widths
[modifiedVerticalIm, modifiedVerticalEn] = reduce_width(testImage, myEnergyImage);
subplot(5,2,7)
imagesc(modifiedVerticalIm);
title('Vertical Reduced Image');
subplot(5,2,8)
imagesc(modifiedVerticalEn);
title('Vertical Reduced Energy Map');

%print reduce height
[modifiedHorizontalIm, modifiedHorizontalEn] = reduce_width(testImage, myEnergyImage);
subplot(5,2,9)
imagesc(modifiedHorizontalIm);
title('Horizontal Reduced Image');
subplot(5,2,10)
imagesc(modifiedHorizontalEn);
title('Horizontal Reduced Energy Map');
