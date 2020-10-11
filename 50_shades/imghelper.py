import random
import os

def compute_rectangle(p1,p2):
    (x1,y1,w1,h1) = p1
    (x2,y2,w2,h2) = p2
    # rectangle is x1,y1 -> x2+w1, y2+h2
    return [x1,y1, x2+w2,y2+h2]

def random_sunglasses():
    sunglasses = os.listdir("sunglasses")
    entry = random.randint(0, len(sunglasses)-1)
    print('Shades:' + sunglasses[entry])
    return 'sunglasses/'+sunglasses[entry]
