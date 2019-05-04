# ECE_5470_Homework_4


********************************************************************
Charlotte Meola
ECE 5470, Digital Image Processing
Homework 4: Automatic Hole Filling
********************************************************************


********************************************************************
This program fills small holes in binary images using a marker and mask
to accomplish morphological reconstruction by dilation.

'Automatic_Hole_Filling.m' MATLAB file accomplishes the following: 

  1. Creates a simple binary image with a binary matrix [I].
  2. Creates a mask (complement of the image) [G].
  3. Creates a structuring element [B].
  4. Creates a marker image [F].
  5. Applies morphological reconstruction to obtain [H] via:
      5A. Dilation of image and stucturing element.
      5B. Keeping pixels in new image that appear in both sets of
          dilated image and complemented original pixels.
  6. Complement the morphological reconstruction to obtain final result,[H^C].
  7. Displays original image [I], mask [G], structuring element [SE], 
          marker [F], and final filled image [H^C].

********************************************************************
