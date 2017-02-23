all: run

build:
	docker build . -t jarron-resume:latest

run: build
	docker run --rm -it -p 4000:4000 jarron-resume:latest

html: build
	docker run --rm -it jarron-resume:latest export resume.html

pdf: build
	docker run --rm -it jarron-resume:latest export resume.pdf