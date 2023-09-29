FROM maven:3.8.1-jdk-11
COPY . /usr/src/app
WORKDIR /usr/src/app
EXPOSE 4000
RUN mvn -f /usr/src/app/pom.xml clean install

FROM adoptopenjdk/openjdk11

MAINTAINER Jonas Rotert

VOLUME /tmp

# Add Spring Boot app.jar to Container
COPY --from=0 "/usr/target/integration-1.0.jar" app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]