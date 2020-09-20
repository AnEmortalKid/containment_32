FROM python:latest

RUN apt-get update
RUN apt-get -y install \
    tesseract-ocr \
    tesseract-ocr-eng \
    libgl1-mesa-dev; 
RUN apt-get clean

RUN pip install --upgrade pip; \
    pip install \
    pillow \
    opencv-python \
    pytesseract

# create if people don't mount them
RUN mkdir -p output
RUN mkdir -p comics

COPY comic_maker.py .

ENTRYPOINT [ "python", "comic_maker.py" ]
