# Docker Zero to Hero

## What is Docker?

Docker is an open platform for building, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications.

## What is Docker Platform?

Docker provides the ability to package and run an application in a loosely isolated environment called a container. The isolation and security lets you run many containers simultaneously on a given host. **Containers are lightweight and contain everything needed to run the application** (libraries, application runtime, dependencies), so you don't need to rely on what's installed on the host.

## Difference Between Docker and Virtual Machine

![Virtual Machine vs Docker](Virtual%20machine%20vs%20Docker.png)

Containers and virtual machines are both technologies used to isolate applications and their dependencies, but they have some key differences:

**Resource Utilization**: Containers share the host operating system kernel, making them lighter and faster than VMs. VMs have a full-fledged OS and hypervisor, making them more resource-intensive, which is a waste of resources (CPU, memory, etc.) compared to Docker.

**Portability**: Containers are designed to be portable and can run on any system with a compatible host operating system. VMs are less portable as they need a compatible hypervisor to run.

**Security**: VMs provide a higher level of security as each VM has its own operating system and can be isolated from the host and other VMs. Containers provide less isolation, as they share the host operating system.

**Management**: Managing containers is typically easier than managing VMs, as containers are designed to be lightweight and fast to deploy.

## Docker Architecture

![Docker Architecture](Docker-Architecture.png)

Docker uses a client-server architecture. The Docker client talks to the Docker daemon, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and daemon can run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface.

## Docker Lifecycle

We can use the above image as reference to understand the lifecycle of Docker.

There are three important components:

- **docker build** → builds docker images from Dockerfile
- **docker run** → runs container from docker images  
- **docker push** → push the container image to public/private registries to share the docker images

![Docker Lifecycle](Docker-Lifecycle.png)

## Understanding the Docker Components

### Docker Daemon

### Docker Daemon

The Docker daemon (dockerd) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

### Docker Client

The Docker client (docker) is the primary way that many Docker users interact with Docker. When you use commands such as `docker run`, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.

### Docker Desktop

Docker Desktop is an easy-to-install application for your Mac, Windows or Linux environment that enables you to build and share containerized applications and microservices. Docker Desktop includes the Docker daemon (dockerd), the Docker client (docker), Docker Compose, Docker Content Trust, Kubernetes, and Credential Helper.

### Docker Registries

A Docker registry stores Docker images. Docker Hub is a public registry that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry.

When you use the `docker pull` or `docker run` commands, the required images are pulled from your configured registry. When you use the `docker push` command, your image is pushed to your configured registry.

### Docker Objects

When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.

### Dockerfile

Dockerfile is a file where you provide the steps to build your Docker Image.

### Images

### Images

An image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization. For example, you may build an image which is based on the ubuntu image, but installs the Apache web server and your application, as well as the configuration details needed to make your application run.

You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

## Installation of Docker

**Reference Link:** [Docker Installation](https://docs.docker.com/get-started/get-docker/)

Since I'm using macOS, I have installed Docker Desktop for Mac with Apple Silicon. Based on your operating system you can install accordingly (Windows, Linux, etc.).

After downloading the package, double click and install it, then drag and drop Docker into Applications. We can see that Docker Desktop is running as per the screenshot attached below. Then you can log in to Docker Desktop and you will be able to see your images and containers if they exist.

![Docker Desktop for Mac](Docker-desktop-for-mac.png)

## How to Dockerize a Project?

```bash
mkdir day-02
cd day-02

# Clone the sample project
git clone https://github.com/docker/getting-started-app.git
cd getting-started-app/

# Create Dockerfile
touch Dockerfile
```

Using the text editor of your choice, paste the content below into the Dockerfile:

```dockerfile
FROM node:18-alpine 
WORKDIR /app 
COPY . . 
RUN yarn install --production 
CMD ["node", "src/index.js"] 
EXPOSE 3000
```

## Details About Dockerfile

- **FROM node:18-alpine** → Linux-based Alpine OS
- **WORKDIR /app** → Work directory which we will execute inside the container
- **COPY . .** → Copies from source local path to inside container
- **RUN yarn install --production** → Installs yarn packages which our project requires
- **CMD ["node", "src/index.js"]** → Executes the container command required to start the application
- **EXPOSE 3000** → Exposes the port to access the app over the public internet

## How to Build the Docker Image and Push to Docker Hub

### Build the Docker Image

Build the docker image based on application code and Dockerfile:

```bash
docker build -t day02 .
```

Verify the image has been created and stored locally:

```bash
docker images
```

### Push to Docker Hub

1. Create a public repository on `hub.docker.com`
2. Login to Docker Hub:
   ```bash
   docker login
   ```
   It will ask for username and password - provide the same and it will connect to Docker Hub.

3. Tag the image:
   ```bash
   docker tag day02:latest mekala/nodejs-test:latest
   ```
   (`day02:latest` is local image tag and `mekala/nodejs-test:latest` is repository tag)

4. Check available images:
   ```bash
   docker images
   ```

5. Push the image to public registry (Docker Hub):
   ```bash
   docker push mekala/nodejs-test:latest
   ```

### Common Docker Commands

```bash
# Pull the image from Docker Hub to local system
docker pull mekala/nodejs-test:latest

# Run the container with local and container ports
docker run -dp 3000:3000 mekala/nodejs-test:latest

# Execute into the container (replace with actual container ID)
docker exec -it f72f59a5b12f sh

# Check all running containers status
docker ps

# List all containers (running or not)
docker ps -a

# Check application container logs
docker logs <container_id>
```

## Multi-Stage Docker Build

### Setup

```bash
mkdir day-03
git clone https://github.com/piyushsachdeva/todoapp-docker
cd todoapp-docker
```

### Create Multi-Stage Dockerfile

Create a `Dockerfile` with the following content:

```dockerfile
FROM node:18-alpine AS installer
WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY . .
RUN npm run build

FROM nginx:latest AS deployer
COPY --from=installer /app/build /usr/share/nginx/html
```

### Dockerfile Explanation

1. **FROM node:18-alpine AS installer** → Uses the official Node.js 18 Alpine-based image. Alpine is a lightweight Linux distribution, reducing the final image size. `AS installer` names this build stage (used later in multi-stage copying).

2. **WORKDIR /app** → Sets `/app` as the working directory inside the container.

3. **COPY package*.json ./** → Copies `package.json` and `package-lock.json` into the container. If dependencies don't change, Docker reuses the cached npm install layer, making builds faster.

4. **RUN npm install** → Installs project dependencies inside the container.

5. **COPY . .** → Copies the entire source code into the container.

6. **RUN npm run build** → Runs the build command (e.g., for a React, Vue, or Angular project).

7. **FROM nginx:latest AS deployer** → Uses the latest NGINX image for serving static files. This second stage does not include Node.js, making the final image smaller and optimized for production.

8. **COPY --from=installer /app/build /usr/share/nginx/html** → Copies the built static files from the installer stage (`/app/build`) to the default NGINX web root (`/usr/share/nginx/html`). This allows NGINX to serve the frontend without Node.js in the final container.

### Build and Run

```bash
docker build -t multistage .
docker images
docker run -it -dp 3000:80 multistage
docker ps
```

## How Docker Works Internally

1. When you run `docker build`, Docker reads the `Dockerfile` line by line and uses your current folder as the build context.

2. Each line in a Dockerfile creates a new image layer. These layers are saved as compressed files inside Docker's storage.

3. Docker uses union file systems like OverlayFS. It stacks all layers from a single container file system.

4. When you run `docker run`, Docker takes the image and adds a writable layer on top - that becomes a container.

5. The container is just a process on your machine. It runs with its own isolated environment using Linux namespaces and cgroups.

6. **Namespaces** isolate process ID, hostnames, network, mount points, and shared memory. **Cgroups** control CPU, RAM, and I/O usage.

7. Docker gives a container a virtual Ethernet interface. By default, it's connected to the `docker0` bridge.

8. If you use `-p` to map ports, Docker sets iptables rules. This forwards traffic from your host to the container.

9. The Docker daemon (`dockerd`) runs in the background. It handles builds, containers, images, volumes, and networks.

10. The Docker CLI talks to the daemon using REST API. It connects over a Unix socket or TCP.

11. Docker volumes live outside the container layer. They're stored in `/var/lib/docker/volumes` and survive container restarts.

12. Any change inside the container is temporary. If you delete the container, the changes are gone unless saved to an image or volume.

13. Docker uses content-based hashes for layers. This makes layers reusable, cacheable, and easy to share.

14. When you push an image, Docker checks which layers are already in the registry. It only uploads what's missing.

---

## Summary

This guide covers Docker from basics to advanced concepts including:
- Docker fundamentals and architecture
- Installation and setup
- Creating and managing Docker images
- Multi-stage builds for optimized production images
- Internal workings of Docker

For more advanced topics, refer to the official [Docker Documentation](https://docs.docker.com/).

## Installation Of Docker ##

**Refrence Link:** [Docker Installation](https://docs.docker.com/get-started/get-docker/)

Since i'm using Mac OS, I have installed docker desktop for mac with apple silicon. Based on your operating system you can install accordingly i.e Windows, Linux etc.

After downloading the package double click and install it and drag and drop docker into applications. We can able to see docker desktop is running as per the screenshot attached below. Then you can login to to the docker desktop then yo will able to see your images and containers if exists.

![alt text](Docker-desktop-for-mac.png)

## How to Dockerize a Project? ##

mkdir day-02

cd day-02

Clone the sample project: git clone git clone https://github.com/docker/getting-started-app.git

cd getting-started-app/

touch Dockerfile

Using the text editor of your choice and paste the as below content.

```bash
FROM node:18-alpine 
WORKDIR /app 
COPY . . 
RUN yarn install --production 
CMD ["node", "src/index.js"] 
EXPOSE 3000
``` 

## Details About Dockerfile ##

Linux based alpine OS

Work directory which we will execute inside the conatiner

It will copy from source local path to inside container

It will install yarn package which requires our project

It will execute the container which requires to start the application

Which exposes the port and access the app over the public internet.

## How to Build the Docker Image and Push Into the Dockerhub ##

Build the docker image based on application code and Dockerfile

docker build -t day02 .

Verify the image has been created and stored locally using the below command:

docker images

Create a public repository on `hub.docker.com` and push the image to remote repo

docker login --> it will ask username and password provide the same and it will connect to dockerhub

Docker tag day-02:latest mekala/nodejs-test:latest --> day02:latest is local image tag and mekala/nodejs-test:latest is repository tag

docker images --> To check the available images

docker push mekala/nodejs-test:latest --> To push the image into public registry i.e (DockerHub)

docker pull mekala/nodejs-test:latest --> Pull the image from docker hub to local system. If it's not available if will pull otherwise it's shows already available.

docker run -dp 3000:3000 mekala/nodejs-test:latest --> Run the container with the local and container ports with the image name.

docker exec -it f72f59a5b12f sh --> It will execute to inside the container. i.e f72f59a5b12f --> Container ID

docker ps --> To check the all running containers status

docker ps -a --> List all containers whether it is running or not.

docker logs <container id> --> We can check the logs of application container


## Multi Stage Docker Build ##

1. mkdir day-03

2. git clone https://github.com/piyushsachdeva/todoapp-docker

3. cd todoapp-docker

4. vi Dockerfile and add the as below content.

```bash
FROM node:18-alpine AS installer
WORKDIR /app
COPY package*.json ./
RUN npm install 
COPY . .
RUN npm run build
FROM nginx:latest AS deployer
COPY --from=installer /app/build /usr/share/nginx/html
```

5. Uses the official Node.js 18 Alpine-based image, Alpine is a lightweight Linux distribution, reducing the final image size.AS installer part names this build stage (used later in multi-stage copying).

6. Sets /app as the working directory inside the container.

7. COPY package*.json ./ --> Copies package.json and package-lock.json into the container. If dependencies don’t change, Docker reuses the cached npm install layer, making builds faster.

8. RUN npm install --> Installs project dependencies inside the container.

9. COPY . . --> Copies the entire source code into the container.

10. RUN npm run build --> Runs the build command (e.g., for a React, Vue, or Angular project)

11. FROM nginx:latest AS deployer --> Uses the latest NGINX image for serving static and This second stage does not include Node.js, making the final image smaller and optimized for production.

12. COPY --from=installer /app/build /usr/share/nginx/html --> Copies the built static files from the installer stage (/app/build)
→ to the default NGINX web root (/usr/share/nginx/html). This allows NGINX to serve the frontend without Node.js in the final container.

13. docker build -t multistage .

14. docker images

15. docker run -it -dp 3000:3000 multistage

16. docker ps

## How Does Docker Works Internally ##

1. when you run docker build Docker reads the `Dockerfile` line by line. it uses your current folder as the build context.

2. Each line in a Dockerfile creats a new image layer. These layers are saved as compressed files inside Docker’s storage.

3. Docker uses union file system like OverlayFS. It stacks all layers from singel container file system.

4. When you run `docker run` Docker takes the image adds a writable layer on top, that becomes a container.

5. The container is just process on your machine. It runs with its’ own isolated environment using linux namespaces and groups.

6. Namespaces isolate process ID, hostnames, network, mount points, shared memory, Cgroups Control CPU, RAM and I/O usgae.

7. Docker gives a container virtual Ethernet interface. By default, it’s connected to the `docker0` bridge.

8. If you use -p to map ports, Docker set’s Ip tables rules. This forwards traffic from your host to container.

9. The docker daemon(`dockerd`) runs in the background. it handles builds, containers, images, volumes and networks.

10. The docker CLI talks to the daemon using REST API, it’s connect over a unix socket or TCP.

11. Docker Volumes lives outside the container layer. They’re stoared in `various/lib/docker/volumes` and survie container restarts.

12. Any change inside the container is temporary. If you delete the container, the changes are gone useless saved  to a imgae or volume.

13. Docker uses content-based hashes for layers. This makes layers are reusable, cacheable and easy to share.

14. When you push the image, Docker checks with the layers are already in the registry. it’s only uploads what’s missing.
