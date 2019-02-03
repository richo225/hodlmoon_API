default: build

build: config
		docker-compose up --build

setup:
	docker-compose run web bundle exec rake db:setup --trace

start: setup
	docker-compose up

tests:
	docker-compose run web bundle exec rake spec
