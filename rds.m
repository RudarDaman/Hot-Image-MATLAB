clc
clear all
close all
% Check Resolution of Camera
% imaqtool
% To check detailed information of Camera in MATLAB
% imaqhwinfo(videoinput('winvideo', 1));

% Start Camera & set image to Colored Image
video = videoinput('winvideo', 1, 'YUY2_640x480');
set(video, 'ReturnedColorSpace', 'RGB');
% Take Snapshot of Image
img = getsnapshot(video);
%For Black & White Image
%img = rgb2gray(im);
imshow(img)

% To save the image to folder
baseDir  = 'rds/ ';
baseName = 'image_';
counter  = 1;
newName  = [baseDir baseName num2str(counter) '.jpg'];
% To prevent image to be replaced
while exist(newName,'file')
    counter = counter + 1;
    newName = [baseDir baseName num2str(counter) '.jpg'];
end    
% Write Image to folder rds
imwrite(img, fullfile(newName));