function image_dilated = remove_noise(I)

    % Increase contrast
    image_contrast_enhanced = imadjust(I);
    
    % Resize image
    image_resized = imresize(image_contrast_enhanced, 0.7);
    
    % Apply Gaussian filtering to reduce noise
    image_smoothed = imgaussfilt(image_resized, 2);
    
    % Binarize the image using Otsu's thresholding
    image_binary = ~imbinarize(image_smoothed);
    
    % Erode the binary image to remove small objects
    image_eroded = imerode(image_binary, strel('disk', 3));
    
    % Remove small objects (noise) from the binary image
    image_cleaned = bwareaopen(image_eroded, 450);
    
    % Dilate the binary image to fill in small gaps
    image_dilated = imdilate(image_cleaned, strel('disk', 2));

    % Display all preprocessing steps
    % figure;
    % 
    % subplot(3, 3, 1), imshow(I), title('Filtered Image');
    % subplot(3, 3, 2), imshow(image_contrast_enhanced), title('Contrast Enhanced');
    % subplot(3, 3, 3), imshow(image_resized), title('Resized Image');
    % subplot(3, 3, 4), imshow(image_smoothed), title('Gaussian Smoothing');
    % subplot(3, 3, 5), imshow(image_binary), title('Binarized Image');
    % subplot(3, 3, 6), imshow(image_eroded), title('Eroded Image');
    % subplot(3, 3, 7), imshow(image_cleaned), title('Noise Removed');
    % subplot(3, 3, 8), imshow(image_dilated), title('Dilated Image');

end

