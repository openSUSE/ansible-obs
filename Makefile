all:
	docker-compose build --build-arg USER_ID=$(shell id -u)

run:
	docker-compose run --rm -u $(shell whoami) ansible-obs
