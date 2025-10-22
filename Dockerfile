# Use official Jenkins LTS image (includes Java)
FROM jenkins/jenkins:lts-jdk21

# Switch to root to install additional packages (git)
USER root

RUN apt-get update \
 && apt-get install -y --no-install-recommends git curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# switch back to jenkins user
USER jenkins

# Expose necessary ports (Render will use 8080)
EXPOSE 8080 50000
