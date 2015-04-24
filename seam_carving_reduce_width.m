testImage = imread('inputSeamCarvingStairs.jpg');

myEnergyImage = energy_image(testImage);

   [modifiedVerticalIm, modifiedVerticalEn] = reduce_width(testImage, myEnergyImage);
for i = 1:249
   [modifiedVerticalIm, modifiedVerticalEn] = reduce_width(modifiedVerticalIm, modifiedVerticalEn);
end

imagesc(modifiedVerticalIm);