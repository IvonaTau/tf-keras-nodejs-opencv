FROM python:3.5

MAINTAINER Ivona Tautkute "ivona.tautkute@tooploox.com"

ARG KERAS_VERSION=1.2.2

RUN apt-get update && apt-get install -y build-essential \
    cmake \
    wget \
    unzip \
    curl \
    git \
    ca-certificates \
    build-essential 

# Install Tensorflow and Object Detection API
RUN pip install tensorflow
RUN apt-get -y install protobuf-compiler python-pil python-lxml
RUN pip install matplotlib

# Install Keras
RUN pip --no-cache-dir install git+git://github.com/fchollet/keras.git@${KERAS_VERSION}

#Install OpenCV
RUN pip install opencv-python

# Install Node.js
RUN mkdir /nodejs && curl http://nodejs.org/dist/v7.9.0/node-v7.9.0-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1
ENV PATH $PATH:/nodejs/bin

# Install gulp, npm with Node.js
RUN npm install gulp
RUN npm install --global gulp-cli
