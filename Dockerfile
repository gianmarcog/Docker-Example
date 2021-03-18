#The FROM instruction initializes a new build stage and sets the Base Image for subsequent instructions
#FROM (image)node - We need a backend for our server.js | Node image get installed/implemented
FROM node:13-alpine

#The ENV instruction sets the environment variable <key> to the value <value>
#In this case for the MongoDB is the username=admin and the password=password
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PW=password

#The RUN instruction will execute any commands in a new layer on top of the current image and commit the results
#Create a directory inside of the container ( /home/app is gonna get create inside the conttainer)
RUN mkdir -p /home/app

#The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>
#Execute on the Host machine
COPY . app/home/app

#The main purpose of a CMD (possible to do multiple RUNS) is to provide defaults for an executing container
#In this case that the server.js file is executing with node
CMD ["node", "/home/app/server.js"]
