testImage = imread('inputSeamCarvingVillage.jpg');

myEnergyImage = energy_image(testImage);

[modifiedHorizontalIm, modifiedHorizontalEn] = reduce_height(testImage, myEnergyImage);
for i = 1:99
   [modifiedHorizontalIm, modifiedHorizontalEn] = reduce_height(modifiedHorizontalIm, modifiedHorizontalEn);
end


imagesc(modifiedHorizontalIm)