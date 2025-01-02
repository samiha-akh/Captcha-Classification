# Captcha-Classification

# Description
The project aims to classify digits in CAPTCHA images. Each image contains three digits, which are either 3, 4, or 5. The task is to identify each digit from the images using image processing techniques and machine learning methods. 
The visual analysis of the images in the dataset reveals several challenges in the dataset. These include noise, blur, overlapping digits, and varying orientations of digits. Repetitive slanted lines and scratch-like patterns are also present around the digits. 
Different image analysis and machine-learning techniques have been used to address these issues.

# Dataset

![captcha_0015](https://github.com/user-attachments/assets/b69c7d13-7ee3-4884-b706-358c743d8e9c)
![captcha_0039](https://github.com/user-attachments/assets/1f9786fe-7b83-4e05-8158-d85f008757ee)
![captcha_0090](https://github.com/user-attachments/assets/843a74c4-c6c1-4f78-b8ef-1bfbac62bb7d)
![captcha_0001](https://github.com/user-attachments/assets/c0006a50-56ad-4770-a81f-8e81693ff53d)

# Data Split
Out of the 1200 given CAPTCHA images, 1000 images were separated for training and 200 for validation.

# Preprocessing
# Pattern Removal
![remove_pattern](https://github.com/user-attachments/assets/c9fa2134-3d96-4ad4-a371-89f19c04c8c7)
# Noise Removal
![remove_noise](https://github.com/user-attachments/assets/32bb4484-4351-460e-85c6-36f686d706f9)

# Feature Extraction
Vector Representation of the Preprocessed Image
Local Binary Pattern (LBP)
Histogram of Oriented Gradients (HOG)
Density Features

# Model
ADABoost model has been used 150 maximum number of splits.
The accuracy on the validation set is 90.00%. The accuracy on the held-out test set is 89.00%. A few tweakings have been done to achieve this accuracy.
![Accuracy](https://github.com/user-attachments/assets/b7cf04ae-57b2-4913-b753-7adac02835a9)
