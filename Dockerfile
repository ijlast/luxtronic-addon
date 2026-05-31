ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.23-2026.05.0
FROM ${BUILD_FROM}

# Install Java 25 and curl for health checks
RUN apk add --no-cache openjdk25-jre curl

# Application directory
WORKDIR /app

# Copy the Luxtronic Spring Boot JAR
COPY luxtronic.jar .

# Copy s6-overlay service definitions
COPY rootfs /
