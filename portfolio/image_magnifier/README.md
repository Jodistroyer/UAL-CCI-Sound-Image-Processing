# Image Magnifier

## Description
This project provides a simple image magnifier tool built in Processing. It allows users to zoom in on specific areas of an image and view them in detail. The magnifier works by enlarging the pixels within a region and drawing them as vectors.

## Requirements
- Written in Processing 4.3
- No special libraries required.

## Operation/Usage
1. **Open the project in a Processing environment**. Ensure you have Processing installed on your system.
2. **Place an image file named "image.jpg"** in the same directory as the sketch. This image will be loaded and used for magnification.
4. **Run the sketch**. The sketch will launch a window displaying the image.
5. **Use the mouse wheel to zoom in and out**. Scrolling up will zoom in, while scrolling down will zoom out.
6. **Move the mouse cursor over the image** to magnify the area around it. The magnified area will be displayed in a circular region centered around the cursor.
   
## How It Works

1. **Saving Drawing State:** The `pushMatrix()` function saves the current drawing state. This includes any transformations such as translation and scaling.

2. **Translation:** The `translate(mouseX, mouseY)` function translates the coordinate system so that it is centered around the current mouse position. This ensures that the magnification effect follows the mouse cursor.

3. **Scaling:** The `scale(scaleFactor)` function scales the coordinate system by the `scaleFactor` variable. This effectively zooms in or out on the image, depending on the value of `scaleFactor`.

4. **Iterating Through Pixels:** Nested loops iterate through all the pixels within the magnified area. For each pixel, the code calculates its distance from the center of the magnifier.

5. **Conditional Check:** It checks if the distance of the pixel from the center is within the specified `magnifySize` scaled by the `scaleFactor`. If it is, the pixel is considered to be within the magnified area.

6. **Pixel Enlargement:** For pixels within the magnified area, the code retrieves the color of the corresponding pixel from the original image using `img.get(x, y)`.

7. **Visual Representation:** The magnified pixels are represented by enlarged rectangles, giving the impression of magnification.

8. **Restoring Drawing State:** Finally, the `popMatrix()` function restores the previous drawing state saved by `pushMatrix()`. This ensures that subsequent drawing operations are not affected by the transformations applied for magnification.
  
## Design Decisions

- **Circular Masking**: Circular masking is used to define the area of magnification, ensuring that only the pixels within this circular region are enlarged.
- **Zoom Controls**: Zooming functionality is implemented using mouse wheel events, allowing users to zoom in and out seamlessly.
- **Visual Feedback**: The zoom level and magnification ring provide visual feedback to the user, enhancing the interactive experience.

## Process
The hardest part was probably the for loop to go through the pixels in an area. But I remember Tom showing us this method in one of his real life lectures, so I just added it in. Most of the solutions to do this were easy to find from the Processing documentation, and from the online lectures.

## Authorship
A code project by Wong Jo-Hann

23/24 Computational Practices: Sound and Image Processing

Creative Computing BSc class

UAL CCI University Of the Arts London
