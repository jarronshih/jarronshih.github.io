FROM node:7.6

RUN npm install -g resume-cli
RUN npm install -g jsonresume-theme-onepage jsonresume-theme-kendall jsonresume-theme-elegant

RUN mkdir /theme
RUN apt-get update
RUN apt-get install -y unzip
RUN cd /theme && wget -O master.zip https://github.com/reverbc/jsonresume-theme-elegant/archive/master.zip?commit=84dc1a1 && unzip master.zip && rm -f master.zip && cd jsonresume-theme-elegant-master && npm link

RUN mkdir /src
WORKDIR /src

ENTRYPOINT ["resume"]
EXPOSE 4000
CMD ["serve"]
