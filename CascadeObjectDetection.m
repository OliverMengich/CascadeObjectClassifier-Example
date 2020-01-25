load('stopSignsAndCars.mat');
positiveInstances = stopSignsAndCars(:,1:2);
% imDir = fullfile(matlabroot,'toolbox','vision','visiondata','stopSignImages');
% addpath(imDir);
negativefolder = fullfile(matlabroot,'toolbox','vision','visiondata','nonStopSigns');
negativeImages = imageDatastore(negativefolder);
trainCascadeObjectDetector('wallUnitDetector.xml',positiveInstances,negativefolder,'FalseAlarmRate',0.1,'NumCascadeStages',5);
detector = vision.CascadeObjectDetector('wallUnitDetector.xml');
img = imread('stopSignTest.jpg');
bbox = step(detector,img);
detectImg = insertObjectAnnotation(img,'rectangle',bbox,'Stop Sign');
figure; imshow(detectImg)
img1 = imread('stopSignTest12.jpeg');
bbox = step(detector,img1);
detectedImage1 = insertObjectAnnotation(img1,'rectangle',bbox,'Stop Sign1');
figure; imshow(detectedImage1)