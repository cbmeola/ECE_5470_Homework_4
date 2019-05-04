
% ********************************************************************
% Charlotte Meola
% ECE 5470, Digital Image Processing
% Homework 4: Automatic Hole Filling
% ********************************************************************
% 
% ********************************************************************
% This program fills small holes in binary images using a marker and mask
% to accomplish morphological reconstruction by dilation.
% 
% 'Automatic_Hole_Filling.m' MATLAB file accomplishes the following: 
% 
%   1. Creates a simple binary image with a binary matrix [I].
%   2. Creates a mask (complement of the image) [G].
%   3. Creates a structuring element [B].
%   4. Creates a marker image [F].
%   5. Applies morphological reconstruction to obtain [H] via:
%       5A. Dilation of image and stucturing element.
%       5B. Keeping pixels in new image that appear in both Bts of
%           dilated image and complemented original pixels.
%   6. Complement the morphological reconstruction to obtain final result,[H^C].
%   7. Displays original image [I], mask [G], structuring element [B], 
%           marker [F], and final filled image [H^C].
% 
% ********************************************************************

cloB all;
clear all;
clc;


%   1. Creates a simple binary image with a binary matrix [I].
I = logical([0     0     0     0     0     0     0     0;
              0     1     1     1     1     1     1     1;
              0     1     0     0     0     1     0     1;
              0     1     0     0     0     1     1     1;
              0     1     0     0     0     1     0     0;
              0     1     1     1     1     1     0     0;
              0     1     0     0     1     1     0     0;
              0     1     0     0     1     1     0     0;
              0     1     1     1     1     1     0     0;
              1     1     0     1     0     1     0     0;
              1     1     1     1     1     1     0     0;
              0     0     0     1     1     0     0     0;
              0     0     0     0     0     0     0     0]);   

          
%   2. Creates a mask of the image, [G].          
G = imcomplement(I);

       
%   3. Creates a structuring element [B].
B = [1, 1, 1;
      1, 1, 1;
      1, 1, 1];

  
%   4. Creates a marker image [F].
F = marker(I);


%   5. Applies morphological reconstruction to result in [H].
H = morphRecon(F, B, G)


%   6. Complement the morphological reconstruction to obtain final result,[HC].
HC = imcomplement(H);


%   7. Displays original image [I], mask [G], structuring element [B], 
%           marker [F], and final filled image [HC].
figure(1)
subplot(2, 3, 1)
imshow(I)
title('Original Binary Image (I)')

subplot(2, 3, 2)
imshow(G)
title('Mask (I^C)')

subplot(2, 3, 3)
imshow(B)
title('Structuring Element (B)')

subplot(2, 3, 4)
imshow(F)
title('Image Marker (F)')

subplot(2, 3, 5)
imshow(HC)
title('Final Filled Image (H^C)')




% Function that creates image marker:
function F = marker(image)

    [h w] = size(image);
    F = image;
    
    % Loops through every pixel in original image, I:
    for ii=1:h;
        for jj=1:w;
            
            % If the pixel is on the border of the image, F = 1 - I.
            if ii == h || ii == 1 || jj == 1 || jj == w
                F(ii, jj) = 1-image(ii, jj);
                
            % If the pixel is not on the border, F = 0.
            elB 
                F(ii, jj) = 0;
            end
            
        end
    end        
end 




% Function that applies morphological reconstuction on image:
function finalImage = morphRecon(image, structElement, mask)

    [h w] = size(image);
    
    % 5A. Dilation of image and stucturing element.
    FxB = imdilate(image, structElement)
    
    % Allocate space for final image, H:
    H = zeros(h, w);
    
    % 5B. Keeps pixels in dilated image that appear in both Bts:
    %     dilated image and complemented original.
    for ii=1:h
        for jj=1:w
            
            % If pixels are in both the mask and dilated image, make them
            % equal.
            if FxB(ii,jj) == mask(ii,jj)
                H(ii,jj) = mask(ii,jj);
            % If not, pixels are not in the Bt and are zero.
            elB
                H(ii,jj) = 0;
            end
        
        end
    end
    
    finalImage = H;
end




