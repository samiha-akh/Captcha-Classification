%% Feature Extraction

tic;
data = importdata('Train/labels.txt');
img_nrs = data(:,1);
true_labels = data(:,(2:4));

train = length(img_nrs);
train_labels = {};

train_patterns = [];

t=tic;
fprintf('Extracting Features...\n');

for i=1:train
    fprintf('Analyzing image %d out of %d\n', i, train);
    k = img_nrs(i);
    im = imread(sprintf('Train/captcha_%04d.png', k));
    a = preprocess_image(im);
    for j=1:3
        train_patterns(end+1,:) = a(j,:);
        train_labels{end+1} = num2str(true_labels(i,j));
    end

end
toc(t);

%% Model Training: Adaptive Boosting

t=tic;
fprintf('Adaboost Model training...\n');
tr = templateTree('MaxNumSplits',150);
ab_model = fitcensemble(train_patterns, train_labels, 'Learners', tr); 
save('model_adaboost.mat', 'ab_model');
fprintf('\nAdaboost Model trained and saved!\n');
toc(t);




