# This is our base image, to see all the available versions, check https://hub.docker.com/_/openjdk
FROM openjdk:11-jdk-slim

# This is the port we're going to tell the container to expose to the outside
EXPOSE 8080

# Copies our jar file to the container
ADD /build/libs/dockeriser-0.0.1-SNAPSHOT.jar app.jar

# Defines how our container will start
ENTRYPOINT [ "java", \
             "-server", \
             "-XX:MaxRAMPercentage=75.0", \
             "-XX:+UseContainerSupport", \
             "-XX:+UseParallelGC", \
             "-Dspring.profiles.active=container", \
             "-Dspring.devtools.restart.enabled=false", \
             "-Djava.security.egd=file:/dev/./urandom", \
             "-Duser.timezone=Europe/London", \
             "-jar", "/app.jar" \
]
