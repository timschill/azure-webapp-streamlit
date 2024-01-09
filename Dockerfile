FROM python:3.11
COPY app/ /usr/app/
COPY requirements.txt /usr/app/
WORKDIR /usr/app/
RUN pip install -r requirements.txt \
    &&  apt-get update && apt-get install libsm6 libxrender1 libfontconfig1 libice6 ffmpeg libxext6 -y
EXPOSE 8000
ENTRYPOINT ["streamlit", "run"]
CMD ["./app.py","--server.port","8000","--theme.base","dark"]