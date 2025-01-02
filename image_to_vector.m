function vec = image_to_vector(I)
    % Resize image to a fixed size
    resized_img = imresize(I, [28 28]);
    
    % Convert to column vector
    vec = double(resized_img(:));
    
    % Normalize vector
    vec = (vec - min(vec)) ./ (max(vec) - min(vec));
end
