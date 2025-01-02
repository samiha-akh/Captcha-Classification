function S = myclassifier(im)
    S = [];
    load ('model_adaboost.mat', 'ab_model');
      
    extracted_features = [];

    a = preprocess_image(im);

    for j=1:3
        extracted_features(end+1,:) = a(j,:);
    end
    
    pred = predict(ab_model, extracted_features);
   

    S(1) = str2double(pred{1});
    S(2) = str2double(pred{2});
    S(3) = str2double(pred{3});
    
end