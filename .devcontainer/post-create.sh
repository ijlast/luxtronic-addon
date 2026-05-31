#!/usr/bin/env bash
set -e

# Install dependencies
sudo apt-get update

sudo apt install -y openjdk-25-jre-headless

# Install Gradle
GRADLE_VERSION=9.5.1
wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -O /tmp/gradle.zip
sudo unzip -d /opt/gradle /tmp/gradle.zip
sudo ln -s /opt/gradle/gradle-${GRADLE_VERSION} /opt/gradle/latest
echo 'export PATH=/opt/gradle/latest/bin:$PATH' | sudo tee /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh

echo "Java and Gradle installed successfully."
java -version
gradle -v
