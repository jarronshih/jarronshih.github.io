FROM node:9.10.0

RUN mkdir /src
WORKDIR /src

RUN npm install hackmyresume -g
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz -C /

ENV PATH="/wkhtmltox/bin:${PATH}"
