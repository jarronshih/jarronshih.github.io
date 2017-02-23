all: html

build:
	docker build . -t jarron-resume:latest

serve: build
	docker run --rm -it -v`pwd`:/src -p 4000:4000 jarron-resume:latest

html: build
	docker run --rm -it -v`pwd`:/src jarron-resume:latest export resume.html

pdf: build
	docker run --rm -it -v`pwd`:/src jarron-resume:latest export resume.pdf