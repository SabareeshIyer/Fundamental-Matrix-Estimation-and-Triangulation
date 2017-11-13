# Fundamental-Matrix-Estimation-and-Triangulation
## Fundamental Matrix Estimation and Triangulation

1. Load the image pair and matching points file into MATLAB
2. Fit a fundamental matrix to the matching points.
   - Implement both _normalized_ and _unnormalized_ algorithms 
   - Visualize results
3. Fit a fundamental matrix to matching points generated for the same images by homography and matching points detected [here.](https://github.com/SabareeshIyer/Image-Stitching-by-Homography-Estimation)
4. Load the camera matrices for the two images.
   - Find the centers of the two cameras.
   - Use linear least squares to triangulate the position of each matching pair of points given the two cameras
   - Display the two camera centers and reconstructed points in 3D.
