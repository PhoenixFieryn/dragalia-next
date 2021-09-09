#Creates a layer from node:alpine image.
FROM node:16.5.0-alpine3.11

#Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD commands
WORKDIR /usr/src/app

#Copy new files or directories into the filesystem of the container
COPY ./package.json .
COPY ./yarn.lock .

#Installs PM2 for prod
RUN npm install -g pm2

#Execute commands in a new layer on top of the current image and commit the results
RUN yarn install

##Copy new files or directories into the filesystem of the container
COPY . .

#Allows you to configure a container that will run as an executable
ENTRYPOINT ["yarn", "run"]