# Getting Started

### Description

This project is a custom solution based in the lab located in https://github.com/digitallab-academy/ms-course-youtube.
This lab was updated using latest Springboot framework (2.7.2) and Springcloud (2021.0.3)
The architecture of this lab is the following:

![Architecture](docs/architecture.png?raw=true "Architecture")

This lab includes OpenAPI specification using reverse engineering method through Springdocs and also includes the RAML 
specification using an OAS to RAML converter located here: https://mulesoft.github.io/oas-raml-converter/

### Configuration to run the project

You need to setup the following enviroment variables:
 * GIT_USER: This contains the username to access the Github repository of the configuration files.
 * GIT_PASSWORD: This contains the password to access the Github repository of the configuration files.

### Run the application

To run the complete solution you should run each application in a different shell session in the following order:
1. Go to *config-service* directory and execute the command *./run.sh*
2. Go to *registry-service* directory and execute the command *./run.sh*
3. Go to *admin-service* directory and execute the command *./run.sh*
4. Go to *gateway-service* directory and execute the command *./run.sh*
5. Go to *customer-service* directory and execute the command *./run.sh*
6. Go to *product-service* directory and execute the command *./run.sh*
7. Go to *shopping-service* directory and execute the command *./run.sh*

You can check some relevant consoles:
* Eureka server: http://localhost:8099
* Admin server: http://localhost:8086/applications

### Relevant considerations

 * The config server should disable the CSRF validation.
 * To get the open-api specification you should call the services in the following way:
   - http://localhost:8080/customers/openapi
   - http://localhost:8080/products/openapi
   - http://localhost:8080/invoices/openapi

* To get the swagger-ui you should call the services in the following way:
   - http://localhost:8080/customers/swagger
   - http://localhost:8080/products/swagger
   - http://localhost:8080/invoices/swagger

### Contracts and samples
In the following paths you can find the contracts in Open API specification:
* [Customers](docs/contracts/customers.json)
* [Products](docs/contracts/products.json)
* [Invoices](docs/contracts/invoices.json)

Also, you can find the contracts in RAML specification:
* [Customers](docs/contracts/customers.raml)
* [Products](docs/contracts/products.raml)
* [Invoices](docs/contracts/invoices.raml)

There are some samples to import in Postman:
* [Samples](docs/samples/store-api-client.postman_collection.json)