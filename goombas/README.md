# goombas

[Goomba](https://en.wikipedia.org/wiki/Goomba) is the first enemy players encounter when playing Super Mario. Using image processing, can we find all the goombas per level?

## Docker

* Build: `docker build . -t goombas`
* Run: `docker run -v ${PWD}/results:/results goombas:latest` 

## Levels

The levels were sourced from [Super Mario Bros Maps](http://ian-albert.com/games/super_mario_bros_maps/). To add another level, download the `.gif` file and place it in the `levels/` directory. When the image is rebuilt, all `.gif` files are converted to `png`

## OpenCV

This sample was heavily inspired by the [template matching](https://docs.opencv.org/master/d4/dc6/tutorial_py_template_matching.html) tutorial for opencv. The thresholding value was played with. 

