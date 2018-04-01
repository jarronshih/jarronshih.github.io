all:

build:
	docker build -t jarron-resume:latest .

dev:
	docker run --rm -it -v`pwd`:/src jarron-resume:latest bash
