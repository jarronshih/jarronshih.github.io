all:

build:
	docker build -t jarron-resume:latest .

dev:
	docker run --rm -it -v`pwd`:/src jarron-resume:latest bash

pdf:
	hackmyresume build resume-FRESH.json to out/test.pdf -t compact

html:
	hackmyresume build resume-FRESH.json to out/test.html -t positive
