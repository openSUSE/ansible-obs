all:
	docker-compose build --build-arg USER_ID=$(shell id -u) --build-arg GROUP_ID=$(shell id -g)
