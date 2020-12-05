FROM maven:adoptopenjdk AS build
LABEL Maintainer="Janpreet Singh"  
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package

FROM adoptopenjdk/openjdk11:alpine-jre
ARG JAR_FILE=/usr/src/app/target/maven-hello-world.jar
WORKDIR /opt/app
COPY --from=build ${JAR_FILE} app.jar  
EXPOSE 8080  
ENTRYPOINT ["java","-jar","app.jar"]  