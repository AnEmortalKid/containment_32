FROM jjanzic/docker-python3-opencv

RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade Pillow

COPY levels/ levels/

# prepare our test environment
RUN mkdir tests
RUN mkdir results

COPY test_prep.py .
RUN python test_prep.py

COPY goomba.png goomba.png
COPY goomba_finder.py . 
ENTRYPOINT ["python", "goomba_finder.py"]