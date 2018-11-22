.PHONY: help dockerize shell shutdown

help:
	@echo 'Available targets:'
	@echo '  make dockerize'
	@echo '  make shell'
	@echo '  make new'
	@echo '  make shutdown'
	@echo '  make launch'

launch:
	docker-compose up

dockerize:
	docker-compose up --build

shell:
	docker-compose exec web sh

new:
	docker-compose run web hanami new . --database=postgres

shutdown:
	docker-compose down
