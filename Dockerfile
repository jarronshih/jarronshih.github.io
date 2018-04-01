FROM node:9.10.0

RUN mkdir /src
WORKDIR /src

RUN npm install hackmyresume -g
