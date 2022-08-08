######### Variables definitions #########
image_name = gateway-service:latest
container_name = gateway-service
network_name = spring-cloud-docker-net
container_internal_port = 8080
container_external_port = 8080

######### Main tasks definition #########
.PHONY: help

## Show commands help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: clean check ## Build the project using gradle and build the image in docker
	gradle build
	docker build --tag=$(image_name) .

run: ## Run the container in detach mode
	docker run -d --rm --net $(network_name) -p$(container_external_port):$(container_internal_port) --name=$(container_name) $(image_name)

stop: ## Stop the running container
	docker stop $(container_name)

logs: ## Open the container logs in follow mode
	docker logs $(container_name) -f

######### Support tasks definition #########
clean:
	rm -rf .gradle gradle gradlew* build

# No matter if any of these tasks failed
	-docker stop $(container_name)
	-docker rmi $(image_name)

check:
    ifeq (, $(shell which gradle))
		$(error "This script uses gradle and it isn't installed - please install it and try again!")
		exit 1
    endif

    ifeq (, $(shell which docker))
		$(error "This script uses docker and it isn't installed - please install it and try again!")
		exit 1
    endif