clc; clear; close all;
fprintf('Loading image data file\n'); 
addpath('/Users/Yanyan/Documents/MATLAB/DATASET/SIPI_Database/');

imgRoot             = '/Users/Yanyan/Documents/MATLAB/DATASET/SIPI_Database/textures/';% test image path
im_ext              = 'tiff';

imnames             = dir([ imgRoot '*' 'tiff']);

feedback = [0 0 0; 
        0 0  0;
        0 0 0];

synaptic =  [0 0 0;
                      0 1 0; 
                      0 0 0];

z = -0.5;

    tTotalStart = tic;
    % data settings
    imname                  = imnames(1).name(1:end-5);
    imPath                  = [ imgRoot imname '.' im_ext]; 
    
    Image.path         =   imPath;
    Image.name         =   imname;
    % 
    Image.image = rgb2gray(imread(Image.path));
    input = mapminmax(im2double(Image.image), -1, 1);
    
output = CeNN_stateCalculation(input, synaptic, feedback, z);

