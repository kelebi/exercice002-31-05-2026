# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

All Maven commands run from `myjavaApp/`:

```bash
# Build (produces target/myjavaapp-1.0.0.jar)
cd myjavaApp && mvn clean package

# Run locally (serves on http://localhost:8080)
cd myjavaApp && mvn spring-boot:run

# Build and run via Docker (multi-stage build, Java 21)
docker build -t myjavaapp . && docker run -p 8080:8080 myjavaapp
```

No test sources exist yet; `mvn test` will pass vacuously.

## Architecture

This is a minimal Spring Boot 3.4 / Java 21 REST application with a single module (`myjavaApp`).

- **Entry point**: `MyJavaAppApplication` — standard `@SpringBootApplication` bootstrap.
- **Only endpoint**: `HelloController` — `GET /` returns `"Hello World!"`.
- **No persistence, no security, no profiles** — `application.properties` sets only `server.port=8080`.

The `Dockerfile` uses a two-stage build: Maven compiles the fat JAR in the builder stage; the runtime stage uses a slim JRE-only image (`eclipse-temurin:21-jre`).

#Je rajoute un peti mot pour tester dans claude MD
