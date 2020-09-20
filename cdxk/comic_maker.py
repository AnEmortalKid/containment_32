import cv2 as cv
import pytesseract
import numpy as np
from pytesseract import Output
import os

def templatify(image_name):
  img_file='comics/'+image_name
  img = cv.imread(img_file)
  template = cv.imread(img_file)
  rewrite = cv.imread(img_file)

  d = pytesseract.image_to_data(cv.cvtColor(img, cv.COLOR_BGR2GRAY), output_type=Output.DICT)
  n_boxes = len(d['text'])
  for i in range(n_boxes):
    # we are sorta sure of these
    if int(d['conf'][i]) > 60:
      text = d['text'][i]
      if text and text.strip() and text.strip() != "|" and text.strip() !="||":
        (x, y, w, h) = (d['left'][i], d['top'][i], d['width'][i], d['height'][i])
        template = cv.rectangle(template, (x, y), (x + w, y + h), (255, 255, 255), -1)
        rewrite = cv.rectangle(rewrite, (x,y), (x+w, y+h), (255,255,255), -1)
        rewrite = cv.putText(rewrite, text, (d['left'][i],d['top'][i]), cv.FONT_HERSHEY_SIMPLEX, 0.5, (0,0,0), 1)

  cv.imwrite('output/template_'+image_name,template)
  cv.imwrite('output/rewrite_'+image_name,rewrite)

for filename in os.listdir("comics"):
    if filename.endswith(".png"):
        print('Templatifying: ' +filename)
        templatify(filename)