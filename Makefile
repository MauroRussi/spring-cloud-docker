######### Variables definitions #########
compose_platform_file = docker-compose-platform.yml
compose_services_file = docker-compose-services.yml
project_platform = spring-cloud-platform
project_services = spring-cloud-services
config_check_cmd = $(curl -Is http://www.google.com | head -n 1)
sleep_platform = 20
sleep_services = 5

######### Main tasks definition #########
.PHONY: help

## Show commands help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build and prepare the Docker image for all subprojects
	$(MAKE) -C config-service build
	$(MAKE) -C admin-service build
	$(MAKE) -C registry-service build
	$(MAKE) -C gateway-service build
	$(MAKE) -C product-service build
	$(MAKE) -C customer-service build
	$(MAKE) -C shopping-service build

compose-up: ## Executes docker compose up for platform and services containers
	docker compose -p $(project_platform) -f $(compose_platform_file) up -d
	@echo Loading platform...
	sleep $(sleep_platform)
	@echo Platform up and running!
	docker compose -p $(project_services) -f $(compose_services_file) up -d
	@echo Loading services...
	sleep $(sleep_services)
	@echo Services up and running!

compose-down: ## Executes docker compose down for platform and services containers
	docker compose -p $(project_services) -f $(compose_services_file) down
	@echo Deleting services...
	sleep $(sleep_services)
	@echo Services deleted!
	docker compose -p $(project_platform) -f $(compose_platform_file) down
	@echo Deleting platform...
	sleep $(sleep_platform)
	@echo Platform deleted!

compose-start: ## Executes docker compose start for platform and services containers
	docker compose -p $(project_platform) -f $(compose_platform_file) start
	@echo Starting platform...
	sleep $(sleep_platform)
	@echo Platform up and running!
	docker compose -p $(project_services) -f $(compose_services_file) start
	@echo Starting services...
	sleep $(sleep_services)
	@echo Services up and running!

compose-stop: ## Executes docker compose stop for platform and services containers
	docker compose -p $(project_services) -f $(compose_services_file) stop
	@echo Stopping services...
	sleep $(sleep_services)
	@echo Services stopped!
	docker compose -p $(project_platform) -f $(compose_platform_file) stop
	@echo Stopping platform...
	sleep $(sleep_platform)
	@echo Platform stopped!