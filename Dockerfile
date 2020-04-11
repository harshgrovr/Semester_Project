FROM ubuntu:latest

MAINTAINER Waleed Abdulla <waleed.abdulla@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

# Essentials: developer tools, build tools, OpenBLAS
RUN apt-get update && apt-get -y update


# Python 3.7

RUN apt-get install -y build-essential python3.7 python3-pip python3-dev git

RUN pip3 install --no-cache-dir --upgrade pip setuptools 


# Pillow and it's dependencies
RUN pip3 install Pillow==2.2.1

# Science libraries and other common packages
RUN pip3 --no-cache-dir install \
    numpy scipy sklearn scikit-image pandas matplotlib Cython requests


# Jupyter Notebook
#
# Allow access from outside the container, and skip trying to open a browser.
# NOTE: disable authentication token for convenience. DON'T DO THIS ON A PUBLIC SERVER.

RUN pip3 install jupyter

#


# Tensorflow 1.14.0 - GPU
#
RUN pip3 install --no-cache-dir tensorflow==1.14.0


# Expose port for TensorBoard
EXPOSE 8888

#


#
# Keras 2.1.5
#
RUN pip3 install --no-cache-dir --upgrade h5py pydot_ng keras==2.2.5

#

#
# PyCocoTools
#
# Using a fork of the original that has a fix for Python 3.
# I submitted a PR to the original repo (https://github.com/cocodataset/cocoapi/pull/50)
# but it doesn't seem to be active anymore.
RUN pip3 install --no-cache-dir git+https://github.com/waleedka/coco.git#subdirectory=PythonAPI


RUN apt-get install -y libsm6 libxext6 libxrender-dev


# OpenCV 
RUN pip3 install opencv-python

RUN apt-get install -y --no-install-recommends default-jdk

# Tensorflow 1.6.0 - GPU
#
RUN pip3 install --no-cache-dir tensorflow-gpu==1.14.0

# PyTorch 0.3.1
#
RUN pip3 install torch && \
    pip3 install torchvision


RUN mkdir /root/.jupyter && \
    echo "c.NotebookApp.ip = '*'" \
         "\nc.NotebookApp.open_browser = False" \
         "\nc.NotebookApp.token = ''" \
         > /root/.jupyter/jupyter_notebook_config.py

RUN pip3 install tqdm

RUN pip3 install fcn

RUN pip3 install torchfcn

WORKDIR "/root"
CMD ["/bin/bash"]
 