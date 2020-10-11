import cv2
import os
from PIL import Image
from imghelper import compute_rectangle,random_sunglasses
from pathlib import Path

# cerner_2^5_2020

# Load the cascade
eye_cascade = cv2.CascadeClassifier('haarcascade_eye.xml')

def draw_sunglasses(image_file,image_name):
    img = cv2.imread(image_file)
    # Convert into grayscale
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    # detect eyes
    eyes = eye_cascade.detectMultiScale(gray, 1.2, 5)
    if len(eyes) != 2:
        print('Did not find 2 eyes, cannot draw sunglasses')
        return

    sorted(eyes, key=lambda x: x[0])
    eye_rect = compute_rectangle(eyes[0], eyes[1])
    rx,ry,rw,rh = eye_rect

    # resize and scale to 110%
    new_size = (int((rw-rx)*1.1), int((rh-ry)*1.1))
    background = Image.open(image_file)
    foreground = Image.open(random_sunglasses()).resize(new_size)
    background.paste(foreground, (rx, ry), foreground)
    background.save('out/'+image_name +'.png', 'PNG')

for filename in os.listdir("people"):
    print('Adding sunglasses to: ' + filename)
    draw_sunglasses('people/'+filename, Path(filename).stem)