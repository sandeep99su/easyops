# Use a base image with OpenJDK 17
FROM openjdk:17-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the fat JAR built with Maven (assuming it's under target/ folder)
COPY target/com.project.rmmserver-0.0.1-SNAPSHOT.jar /app/rmmserver.jar

# Expose the port your app will listen on (adjust this as needed)
EXPOSE 8080

# Command to run the app
CMD ["java", "-jar", "rmmserver.jar"]
