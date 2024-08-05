# Yolomy E-commerce

Welcome to the Yolomy E-commerce website where you get all your client needs satisfied upon the completion of the depolyment of our custom DevOps class assignment.

## Getting started
We will start by covering the following features in the table of contents which will cover a wide range of information critical in the clone and test of the repository for the E-commerce website.

## Table Of Contents
- [Prerequisites](#prerequisites)
- [Requirements](#Requirements)
- [Getting Started](#getting-started)
- [Unit Testing](#unit-testing)
- [Creating Docker Images](#creating-Docker-images)
- [Dockerhub Images](#dockerhub-images)
- [Contributing](#contributing)
- [License](#License)

## Prerequisites
Before you begin, make sure you have the following prerequisites:

- Familiarity with version control (Git & GitHub)
- Ubuntu 22.04 LTS installed in your laptop (Or any OS environment you are comfortable with it, and its commands)
- VS Code for the ease of workflow and code visualizattion

## Requirements
Make sure that you have the following installed:
- [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04) 
- [npm](https://nodejs.org/en/download/package-manager) 
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`



## Getting Started
1. Clone the repository to your local machine:

    - Clone with SSH

   ```bash
   git clone git@github.com:Amuturia/yolo.git
   ```

   - Clone with HTTPS

   ```bash
   git clone https://git@github.com:Amuturia/yolo.git
   ```
   

2. Change to the project directory:
 
   ```bash
   cd client/
   ```
    Run the folllowing command to install the dependencies 
   ```bash
   npm install
   ```
    Run the folllowing to start the app
   ```bash
   npm start
   ```
3. Open a new terminal and run the same commands in the backend folder
     ```bash
     `cd ../backend`
     `npm install`
     `npm start`
     ```
    
## Unit Testing
Go ahead and add a product (note that the price field only takes a numeric input)

## Creating Docker images
To begin the creation of your docker image you will first require that you touch a *Dockerfile* into the project folders *i.e backend and client* folders respectively.
This can be achieved by navigating to the client folder fom th Yolo root folder by:
```bash
 cd client/
 touch Dockerfile
```
and in the backend folder by: 
```bash
cd backend/
touch Dockerfile
```
### Build the Docker image:
Open a terminal, navigate to the directory containing your Dockerfile, and run the following command:
```bash
docker build -t docker.io/<username>/<container_name>:<version> .
```
The docker command will build and image and tag it with the dockerhub directory default (docker.io) followed by the username *(of your dockerhub account)*, the *name of your container*, followed by the *:version* of your build.
The . at the end is very important as it instructs that all source files are located, which in this instance of the command will be in the client/backend folders.

### Create a bridge network:
If you don't already have a bridge network, you can create one with the following command:
```bash
docker network create –driver bridge my_bridge_network
```
Replace my_bridge_network with your preferred network name.
Include the –driver bridge to create a specific network type: bridge

### Running the docker image:
Run the Docker container on the bridge network
```bash
docker run -d --name yolomy_app --network my_bridge_network -p 3000:3000 yolomy:v1.0.1
```
````
        -d: Run the container in detached mode (in the background).
    	--name yolomy_frontend: Give the container a name (yolomy_frontend).
    	--network app-network: Connect the container to the specified bridge network.
    	-p 3000:3000: Map port 3000 of the host to port 3000 of the container.
    	yolomy:v1.0.0: Specify the image and tag to use.
````

## Dockerhub Images
Open a terminal and run the following commands:
````bash
docker login
````
Check the Current Logged-In User: Use the docker info command to display information about the Docker installation, including the currently logged-in user.
 ````bash
 docker info 
````
Look for the *Username* field in the output. This field shows the Docker Hub username that is currently logged in.
Example output:
```
Client:
 Context:	default
 Debug Mode: false
 Plugins:
  buildx: Build with BuildKit (Docker Inc., v0.8.2)
  compose: Docker Compose (Docker Inc., v2.2.3)

Server:
 Containers: 2
 Running: 1
 Paused: 0
 Stopped: 1
 Images: 5
 Server Version: 20.10.12
 Storage Driver: overlay2
  ...
 Username: `your_dockerhub_username`
  ...
```

This will give you the configured dockerhub account configured in your app ahead of push to Dockerhub.

### Push to Dockerhub
Push the Docker Image to Docker Hub:
````bash
docker push docker.io/<dockerhub_username>/<Image_name>:<version>
````
## Contributing
We encourage contributions! If you have suggestions, enhancements, or bug fixes, please [submit a pull request](https://github.com/Amuturia/yolo/pulls).


## License
This project is licensed under the [MIT License](./LICENSE).
# yolo
