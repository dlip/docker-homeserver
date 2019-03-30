
include .env
export $(shell sed 's/=.*//' .env)

.env:
	cp .env.example .env

.PHONY: network
network:
	docker network create docker-homeserver

restart-%:
	@cd $* && docker-compose restart

down-%:
	@cd $* && docker-compose down

down: $(patsubst %, down-%, $(SERVICES))

logs-%:
	@cd $* && docker-compose logs -f

up-%:
	@cd $* && docker-compose up -d

up: $(patsubst %, up-%, $(SERVICES))

stop-%:
	@cd $* && docker-compose stop

stop: $(patsubst %, stop-%, $(SERVICES))