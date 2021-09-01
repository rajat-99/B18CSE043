# B18CSE043

## Author Details
- Name: Rajat Sharma
- Roll No: B18CSE043

## Create a simple web application using ExpressJS Framework
- Refer to app.js for the source code, and package.json for the dependencies

## Create a docker image
- Create a dockerfile in the repository and add the following lines into it: 
```sh
# Specify the base image that we are using (in this case, ubuntu)
$ FROM ubuntu

# Install node and npm
$ RUN apt update
$ RUN apt -y install nodejs
$ RUN apt -y install npm

# Set NODE_ENV environment variable to production, since it is more efficient that development environment
$ ENV NODE_ENV=production

# Create a working directory
$ WORKDIR /app

# Copy node package.json and package-lock.json into the working directory
$ COPY ["package.json", "package-lock.json*", "./"]

# Install all node modules for a production environment
$ RUN npm install --production

# Copy the source code into the image
$ COPY . .

# Expose the port where the server is hosted on the container to the host
$ EXPOSE 3000

# Start the server
$ CMD ["node", "app.js"]
```

## Build the docker container
```sh
$ docker build --tag q2 .
```

## Start the container
```sh
# Start the container q2, and publish its port 3000 onto port 8080 of the host
$ docker run -p 8080:3000 -d q2
```