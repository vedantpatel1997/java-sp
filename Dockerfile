# Use Maven image to build the application
FROM maven:3.9.5-eclipse-temurin-21 AS builder

# Set the working directory for the build process
WORKDIR /build

# Copy the Maven project files (pom.xml and src directory)
COPY pom.xml .
COPY src ./src

# Run Maven to build the application
RUN mvn clean package -DskipTests

# Use a lightweight base image with Java support for the runtime
FROM eclipse-temurin:21-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build stage into the runtime stage
COPY --from=builder /build/target/java-sp-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your app runs on (default is 8080 for Spring Boot)
EXPOSE 8080

# Define the command to run your app
CMD ["java", "-jar", "app.jar"]




# # Use a lightweight base image with Java support
# FROM eclipse-temurin:21-jdk-alpine

# # Set the working directory inside the container
# WORKDIR /app

# # Copy the JAR file from the target folder into the container
# COPY target/java-sp-0.0.1-SNAPSHOT.jar app.jar

# # Expose the port your app runs on (default is 8080 for Spring Boot)
# EXPOSE 8080

# # Define the command to run your app
# CMD ["java", "-jar", "app.jar"]
