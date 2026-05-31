ARG ARCH=aarch64
ARG BUILD_FROM=ghcr.io/home-assistant/${ARCH}-base:3.23
FROM ${BUILD_FROM}

RUN apk update
# Install Java 25 and curl for health checks
RUN apk add --no-cache openjdk25 

# Application directory
WORKDIR /app

# Copy the Luxtronic Spring Boot JAR
COPY luxtronic.jar .

# Copy s6-overlay service definitions
COPY rootfs /

RUN dos2unix /etc/s6-overlay/s6-rc.d/luxtronic/*
RUN dos2unix /etc/s6-overlay/s6-rc.d/luxtronic-log/*
RUN chmod +x /etc/s6-overlay/s6-rc.d/luxtronic/run