build:
	docker build -t plotman ./docker-plotman
run:
	docker run -it --rm plotman
bash:
	docker run -it --rm --entrypoint="/bin/bash" plotman

.PHONY: build run bash