function F = FeatureExtraction(I)

    % Convert image to vector
    ImageVector = image_to_vector(I);

    % Texture Features (e.g., using LBP):
    lbpFeatures = extractLBPFeatures(I);

    % Resize to ensure consistency in block processing
   fixed_size = [56, 56];
   resized_img = imresize(I, fixed_size);
   % Binarize the image (if not already binary)
   if ~islogical(resized_img)
       binary_img = ~imbinarize(resized_img);
   else
       binary_img = resized_img;
   end
  
   % Define block size and compute pixel density
   block_size = [7, 7];
   density_features = blockproc(binary_img, block_size, @(block) sum(block.data(:)) / numel(block.data));
   density_vector = density_features(:);
   % Compute HOG features from the resized image
   [hogFeatures, ~] = extractHOGFeatures(resized_img);


    % Combine features (early fusion)
    F = [ImageVector;  lbpFeatures(:); density_vector; hogFeatures(:)];

    % Optional: Normalize the combined feature vector
    F = normalize(F, 'scale');

end



