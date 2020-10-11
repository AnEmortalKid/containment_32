FROM jjanzic/docker-python3-opencv

RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade Pillow

# in case not mounted
RUN mkdir -p out
COPY sunglasses/ sunglasses/
COPY people/ people/
COPY haarcascade_eye.xml .

COPY imghelper.py .
COPY shades.py .
ENTRYPOINT [ "python", "shades.py" ]
