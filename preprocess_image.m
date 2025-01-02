function F = preprocess_image(I)

    % Remove Patterns from Image
    FilteredImage = remove_pattern(I);

    % Remove Noise and Obstacles
    ProcessedImage = remove_noise(FilteredImage);
    
    % Extract Features
    F = extract_digits(ProcessedImage);

end



