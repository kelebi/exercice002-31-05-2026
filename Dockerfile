# ─── Stage 1: BUILD ────────────────────────────────────────────────────────────
# Use Maven with OpenJDK 21 to compile and package the application
FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

# Copy pom.xml first so Docker can cache the dependency download layer
COPY ./myjavaApp/pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build the fat JAR (skipping tests for speed)
COPY ./myjavaApp/src ./src
RUN mvn clean package -DskipTests

# ─── Stage 2: RUN ──────────────────────────────────────────────────────────────
# Use a lightweight OpenJDK 21 JRE image — no build tools, smaller image size
FROM eclipse-temurin:21-jre

WORKDIR /app

# Copy only the built JAR from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Expose port 8080 (documents intent; actual mapping is done with -p at runtime)
EXPOSE 8080

# Start the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]


# Un petit changement pour tester le pipeline CI/CD avec Jenkins et Docker.

# Un autre changement de kenibiele version 2.0

