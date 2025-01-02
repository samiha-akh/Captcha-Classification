function extracted_features = extract_digits(binary_image)

   % Extract digits from a binary image
   % Inputs:
   %   binary_image - Binary image containing digits to be extracted
   % Outputs:
   %   extracted_features - Features extracted for each digit

   % Identify connected components in the binary image
   connected_components = bwconncomp(binary_image, 8);
   component_properties = regionprops(connected_components, 'Image');
   extracted_features = [];

   if connected_components.NumObjects == 1
       % Case: Single connected component
       [height, width] = size(component_properties(1).Image);
       segment_width = round(width / 3); % Split width into three parts

       % Crop the component into three parts
       digit_image1 = imcrop(component_properties(1).Image, [0 0 segment_width height]);
       digit_image2 = imcrop(component_properties(1).Image, [segment_width 0 segment_width height]);
       digit_image3 = imcrop(component_properties(1).Image, [2 * segment_width 0 segment_width height]);

       % Extract features for each segment
       extracted_features(1, :) = FeatureExtraction(digit_image1);
       extracted_features(2, :) = FeatureExtraction(digit_image2);
       extracted_features(3, :) = FeatureExtraction(digit_image3);

   elseif connected_components.NumObjects == 2
       % Case: Two connected components
       [height1, width1] = size(component_properties(1).Image);
       [height2, width2] = size(component_properties(2).Image);

       if width1 > width2
           % If the first component is wider, split it
           digit_image1 = imcrop(component_properties(1).Image, [0 0 round(width1 / 2) height1]);
           digit_image2 = imcrop(component_properties(1).Image, [round(width1 / 2) 0 round(width1 / 2) height1]);
           digit_image3 = component_properties(2).Image;
       else
           % If the second component is wider, split it
           digit_image1 = component_properties(1).Image;
           digit_image2 = imcrop(component_properties(2).Image, [0 0 round(width2 / 2) height2]);
           digit_image3 = imcrop(component_properties(2).Image, [round(width2 / 2) 0 round(width2 / 2) height2]);
       end

       % Extract features for each segment
       extracted_features(1, :) = FeatureExtraction(digit_image1);
       extracted_features(2, :) = FeatureExtraction(digit_image2);
       extracted_features(3, :) = FeatureExtraction(digit_image3);

   elseif connected_components.NumObjects == 3
       % Case: Three connected components
       % Extract features directly from each component
       extracted_features(1, :) = FeatureExtraction(component_properties(1).Image);
       extracted_features(2, :) = FeatureExtraction(component_properties(2).Image);
       extracted_features(3, :) = FeatureExtraction(component_properties(3).Image);

   else
       % Case: More than three connected components (fallback scenario)
       % Extract features from the first three components
       extracted_features(1, :) = FeatureExtraction(component_properties(1).Image);
       extracted_features(2, :) = FeatureExtraction(component_properties(2).Image);
       extracted_features(3, :) = FeatureExtraction(component_properties(3).Image);
   end
end


