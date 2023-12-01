#Dockerfile
FROM maven:3.8.5-openjdk-17-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:17-jdk-slim

WORKDIR /opt/app

COPY --from=build /target/spring-boot-hw3.jar spring-boot-hw3.jar

ENTRYPOINT ["java","-jar","spring-boot-hw3.jar"]
