FROM node:8.9.1

RUN mkdir /src
WORKDIR /src

RUN apt-get update && apt-get install -y unzip && apt-get clean
RUN npm install -g resume-cli jsonresume-theme-onepage jsonresume-theme-kendall jsonresume-theme-elegant \
  && npm cache clear --force

# import theme 
RUN mkdir -p /theme && cd /theme \
  && wget -O master.zip https://github.com/reverbc/jsonresume-theme-elegant/archive/master.zip?commit=84dc1a1 \
  && unzip master.zip && rm -f master.zip \
  && cd jsonresume-theme-elegant-master \
  && npm link


ENTRYPOINT ["resume"]
EXPOSE 4000
CMD ["serve"]
