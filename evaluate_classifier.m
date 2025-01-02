tic
data = importdata('Test/labels.txt');
img_nrs = data(:,1);
true_labels = data(:,(2:4));

my_labels = [];
N = length(img_nrs);


for n = 1:N
    k = img_nrs(n);
    im = imread(sprintf('Test/captcha_%04d.png', k));
    my_labels(end+1,:) = myclassifier(im);
end

fprintf('%f\n\n',mean(sum(abs(true_labels - my_labels),2)==0)*100);

toc

