.PHONY: build
version = 0.9.1.1

build:
	docker build -t fntlnz/influxdb:$(version) .

push:
	sudo docker push fntlnz/influxdb:$(version)
