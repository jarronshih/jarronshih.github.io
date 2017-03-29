all: serve

build:
	docker build . -t jarron-resume:latest

serve: build
	docker run --rm -d -v`pwd`:/src -p 4000:4000 --workdir /theme/jsonresume-theme-elegant-master --name resume-serve jarron-resume:latest serve --resume /src/resume.json

html: build
	docker run --rm -it -v`pwd`:/src --name resume-builder jarron-resume:latest export resume.html --theme elegant
	mv resume.html index.html

clean:
	docker rm -f resume-builder resume-serve
