FROM node:7.6

RUN npm install -g resume-cli
RUN npm install -g jsonresume-theme-onepage
RUN mkdir /src
WORKDIR /src

ENTRYPOINT ["resume"]
EXPOSE 4000
CMD ["serve"]