# Use a base image with OpenJDK
FROM openjdk:17-slim
# Set the working directory inside the container
WORKDIR /app
# Copy the pre-built JAR file from your GitHub repo into the container
COPY com.project.rmmserver-0.0.1-SNAPSHOT.jar /app/rmmserver.jar
# Expose the WebSocket server port (assuming 8080)
EXPOSE 8080
# Command to run the app
CMD ["java", "-jar", "rmmserver.jar"]