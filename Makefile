.PHONY: help dockerize shell shutdown

help:
	@echo 'Available targets:'
	@echo '  make dockerize'
	@echo '  make shell'
	@echo '  make shutdown'

dockerize:
	docker-compose up --build

shell:
	docker-compose exec web sh

new:
	docker-compose run web hanami new .

shutdown:
	docker-compose down
