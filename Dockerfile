# Use Maven to build and JDK to run the app
FROM maven:3.8.5-openjdk-17-slim AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source files
COPY pom.xml /app/
COPY src /app/src/

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use a slim JDK image to run the application
FROM openjdk:17-slim

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/com.project.rmmserver-0.0.1-SNAPSHOT.jar /app/rmmserver.jar

# Expose the WebSocket port (adjust as needed)
EXPOSE 8080

# Run the JAR file
CMD ["java", "-jar", "rmmserver.jar"]
