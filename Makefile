all:
	docker run --rm -it -v`pwd`:/src jarron-resume:latest bash -c 'make pdf; make html'

build:
	docker build -t jarron-resume:latest .

dev:
	docker run --rm -it -v`pwd`:/src jarron-resume:latest bash

pdf:
	hackmyresume build \
		resume-FRESH/*.json \
		resume-FRESH/options/writing.min.json \
		to dist/resume.pdf --theme compact
	cp dist/resume.pdf one-page/resume-`date -I`.pdf

html:
	hackmyresume build resume-FRESH/*.json to dist/resume.html --theme positive
	sed -e '/<head>/r gtag.head' dist/resume.html > index.html

text:
	hackmyresume build resume-FRESH/*.json to dist/resume.txt
