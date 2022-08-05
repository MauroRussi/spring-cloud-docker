# Recommended installation of OpenJDK
FROM eclipse-temurin:17_35-jdk-alpine
MAINTAINER mrussi
COPY build/libs/config-service-0.0.1-SNAPSHOT.jar config-service.jar
ENTRYPOINT ["java", "-jar", "/config-service.jar"]