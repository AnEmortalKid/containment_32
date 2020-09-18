from PIL import Image, ImageDraw, ImageFont #dynamic import
import os
from pathlib import Path

# modify all available level gifs into pngs on construction
for filename in os.listdir("levels"):
  if filename.endswith(".gif"):
    gif='levels/'+filename
    img = Image.open(gif)
    name=Path(filename).stem
    img.save('tests/'+name+".png",'png', optimize=True, quality=70)
