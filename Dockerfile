FROM maven:3.8.1-openjdk-17-slim
COPY . /DocumentExporter
WORKDIR /DocumentExporter

RUN mvn clean install

FROM eclipse-temurin:17-jdk-alpine

MAINTAINER Jonas Rotert

VOLUME /tmp

# Add Spring Boot app.jar to Container
COPY --from=0 "/DocumentExporter/target/DocumentExporter-*.jar" app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]