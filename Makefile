.PHONY: start

start: docker-stop
	docker-compose -f docker-compose.yml up

docker-stop:
	docker-compose -f docker-compose.yml stop
	docker-compose -f docker-compose.yml rm -f
	docker-compose -f docker-compose.yml down
