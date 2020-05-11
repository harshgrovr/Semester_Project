# Text Line Segmentation
- This repository contains two directories
  - Mask_RCNN (includes dataset and code for Training with MaskRCNN and generating Ensembled Data)
  - Ensembling_Training_with_FCN8 (includes code for training with FCN8 model using Ensembled data generated in above step)
  
  
  #### Set Up
  ##### Using Docker
  ###### [Install Docker](https://docs.docker.com/install/)
  ###### Install nvidia-docker
  - distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
  - curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
  - curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

  - sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
  - sudo systemctl restart docker

  ###### Training Mask RCNN and generating Ensemled data (Tensorflow-gpu)
  - docker run -it -p 8888:8888 -v $PWD:/tf/ harshgrover51/mindmap:tf-gpu-1.14.0
  - Open Browser and run locahost:8888 to launch notebook and copy paste the code from terminal
  ###### Training FCN8 from the output of previous step (Pytorch-gpu)
  -  docker pull harshgrover51/mindmap:pytorch-gpu
  -  docker run -it -p 8888:8888 --gpus all --volume=$PWD:/jupyter --name pytorch-gpu harshgrover51/mindmap:pytorch-gpu
  -  cd /jupyter
  -  jupyter notebook --ip 0.0.0.0 --no-browser --allow-root

  ##### Using Conda
  - This repo contains two environment files fcn8_ensembling.yml and mask_rcnn.yml for setting up environment for FCN8 and MaskRCNN respectively. 
  - Make sure you have conda installed and using following commands create two environments. YML files can be found in "Conda_Env_Files" Folder:
    - conda env create -f fcn8_ensembling.yml
    - conda env create -f mask_rcnn.yml
  - After installation from above step activate the environment:
    - conda activate cuda10
  #### I) Training Mask RCNN and generating Ensemled data
  - If you just wanna to see results for MaskRCNN as mentioned in project report, download the weights from following link and put them under [logs](https://github.com/harshgrovr/Semester_Project/tree/master/Mask_RCNN/logs) folder:
    - [Weights for Resized_Image_Mode](https://drive.google.com/file/d/1Ln5RcC9RlzHK5NTMzjsF3_X5GXYp2F7L/view?usp=sharing) gives accuracy of 92.13 % (best accuracy)  
    - [Weights for Random_Crop Mode](https://drive.google.com/file/d/1dM_86GJXRrx8Bdo_Y4TeuL1H45aox56y/view?usp=sharing)
  -  Execute the follwing jupyter notebook: [Mask_RCNN_notebook](https://github.com/harshgrovr/Semester_Project/blob/master/Mask_RCNN/samples/shapes/MaskRCNN.ipynb)
  - If you want to train the network from scratch,  uncomment the code under Training section, that will train the network and will save the weights.  
  - Dataset and results can be found under: [Dataset](https://github.com/harshgrovr/Semester_Project/tree/master/Mask_RCNN/datasets/documents/images) and "Semester_Project/tree/master/Mask_RCNN/output_test_prediction" (will be generated during prediction time).
  - This notebook contains code for the sections like Visualzing Anchors and also the Prediction on Cropped Image and Stiching the Image to get full Size prediction.
 
  #### II) Training FCN8 from the output of previous step
    - Activate environment using following command: conda activate vdl_project
    - Run the following notebook file for the process: [Training FCN8 with Ensembled Data](https://github.com/harshgrovr/Semester_Project/blob/master/Ensembling_Training_with_FCN8/Ensembling_training_with_FCN8.ipynb) resp.
    - If you just wanna to see results for FCN8 as mentioned in project report, download the weights from following link: [Weights for Ensembled Training](https://drive.google.com/file/d/1WbUGWWRz_gxLZlhRTtE6IVoOvUGvj4lS/view?usp=sharing) and put them under [Ensembling_Training_with_FCN8](https://github.com/harshgrovr/Semester_Project/tree/master/Ensembling_Training_with_FCN8) folder:
    - Dataset and results can be found under: [Dataset](https://github.com/harshgrovr/Semester_Project/tree/master/Ensembling_Training_with_FCN8) and "Semester_Project/tree/master/Mask_RCNN/log-mg3/Ensembling_Training_with_FCN8/prediction-private" resp. (will be generated during prediction time).
  
