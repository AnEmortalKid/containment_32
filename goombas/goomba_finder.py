import cv2 as cv
import numpy as np
import os

# cerner_2^5_2020

# ideally we'd use haar classifier or iterate over multiple templates
template = cv.imread('goomba.png',0)

def find_goombas(image_file, image_name):
  img_rgb = cv.imread(image_file)
  img_gray = cv.cvtColor(img_rgb, cv.COLOR_BGR2GRAY)

  w, h = template.shape[::-1]
  # standard template match
  res = cv.matchTemplate(img_gray,template,cv.TM_CCOEFF_NORMED)
  threshold = 0.75
  loc = np.where( res >= threshold)

  goomba_count = 0
  for pt in zip(*loc[::-1]):
    cv.rectangle(img_rgb, pt, (pt[0] + w, pt[1] + h), (0,0,255), 2)
    goomba_count += 1
  
  print('There are ' + str(goomba_count) + ' goombas in ' + image_name)
  # export out the results
  cv.imwrite('results/'+image_name,img_rgb)

# todo make input_levels
for filename in os.listdir("tests"):
    if filename.endswith(".png"):
        find_goombas("tests/"+filename, filename)
