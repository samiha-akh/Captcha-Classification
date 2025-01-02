function filtered_img = remove_pattern(I)

    if size(I, 3) == 3
        gray_img = rgb2gray(I);
    else
        gray_img = I;
    end
    
    img_double = double(gray_img);
    
    
    fft_img = fft2(img_double);
    fft_img_shifted = fftshift(fft_img);
    
    
    [rows, cols] = size(fft_img_shifted);
    center_row = round(rows / 2);
    center_col = round(cols / 2);
    
    notch_filter = ones(rows, cols);
    
    i = center_row - 3;
    j = center_col - 7;
    
    while i >= 1 && j >= 1
        notch_filter(i:i, j:j) = 0; 
        notch_filter(rows-i+1:rows-i+1, cols-j+1:cols-j+1) = 0;
        i = i - 3;
        j = j - 7;
    end
    
    filtered_fft_img = fft_img_shifted .* notch_filter;
    ifft_img_shifted = ifftshift(filtered_fft_img);
    filtered_img = uint8(ifft2(ifft_img_shifted));

    % Display FFT before and after filtering (for debugging)
     %figure;  
     %subplot(1, 3, 1), imshow(log(abs(fft_img_shifted) + 1), []), title('Original FFT');
     %subplot(1, 3, 2), imshow(log(abs(filtered_fft_img) + 1), []), title('Filtered FFT');
     %subplot(1, 3, 3), imshow(filtered_img, []), title('Filtered Image');

end

