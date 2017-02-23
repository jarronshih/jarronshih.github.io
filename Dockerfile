FROM node:7.6

RUN npm install -g resume-cli
RUN mkdir /src
WORKDIR /src

ONBUILD COPY resume.json /src

ENTRYPOINT ["resume"]
EXPOSE 4000
CMD ["serve"]