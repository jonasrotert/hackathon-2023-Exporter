FROM maven:3.8.1-openjdk-17-slim
COPY . /DocumentExporter
WORKDIR /DocumentExporter

RUN mvn clean install

FROM eclipse-temurin:17-jdk-alpine

MAINTAINER Jonas Rotert

VOLUME /tmp

# Add Spring Boot app.jar to Container
COPY --from=0 "/DocumentExporter/target/DocumentExporter-*.jar" app.jar

EXPOSE 8080

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -Dspring.config.location=/etc/java-spring/application.properties -jar /app.jar" ]