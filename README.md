# Getting Started

### Description

This project is an evolution of the Spring Cloud Basic project located in https://github.com/MauroRussi/spring-cloud-basic.

The details and new features of this lab are:
 * The applications view of the architecture did not change.
 * The technology view of the architecture changed, now all the applications are deployed in containers using docker and docker-compose.
 * There is a platform docker compose project that includes the support applications around Spring Cloud such as:
   - config-service
   - admin-service
   - registry-service
   - gateway-service
 * There is a services docker compose project that includes the business specific microservices such as:
   - product-service
   - customer-service
   - shopping-service
 * The run.sh shells were replaced by Make files scripts.
 * Non necessary external ports were removed.
 
The new deployment of this lab is the following:

![Deployment Diagram](docs/deployment%20view.png?raw=true "Deployment Diagram")

### Configuration to run the project

You need to setup the following enviroment variables in the [.env file](./config-service/.env):
 * GIT_USER: This contains the username to access the Github repository of the configuration files.
 * GIT_PASSWORD: This contains the password to access the Github repository of the configuration files.

### Run the application

To run the complete solution you should go to the root directory of the project and execute any of the following commands using the *make* script:
 * *make build*: Build and prepare the Docker image for all subprojects.
 * *make compose-down*: Executes docker compose down for platform and services containers.
 * *make compose-start*: Executes docker compose start for platform and services containers.
 * *make compose-stop*: Executes docker compose stop for platform and services containers.
 * *make compose-up*: Executes docker compose up for platform and services containers.