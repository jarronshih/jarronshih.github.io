all:

build:
	docker build -t jarron-resume:latest .

dev:
	docker run --rm -it -v`pwd`:/src jarron-resume:latest bash

pdf:
	hackmyresume build resume-FRESH/*.json to out/resume.pdf -t compact
	# cp out/resume.pdf one-page/resume-`date -I`.pdf

html:
	hackmyresume build resume-FRESH/*.json to out/resume.html -t positive
	cp out/resume.html index.html
