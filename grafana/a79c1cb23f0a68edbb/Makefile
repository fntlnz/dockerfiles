.PHONY: build
version = a79c1cb23f0a68edbb

build:
	docker build -t fntlnz/grafana:$(version) .

push:
	sudo docker push fntlnz/grafana:$(version)
