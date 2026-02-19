# Stage 1: build
FROM eclipse-temurin:17-jdk-alpine AS builder

WORKDIR /build

# Maven
RUN apk add --no-cache maven

# Dependency layer (cached unless pom changes)
COPY pom.xml .
RUN mvn dependency:go-offline -B -q

# Source and build
COPY src ./src
RUN mvn package -B -q -DskipTests

# Stage 2: run
FROM eclipse-temurin:17-jre-alpine

RUN apk add --no-cache wget

WORKDIR /app

RUN addgroup -g 1000 app && adduser -u 1000 -G app -D app
USER app

COPY --from=builder /build/target/qwen-*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
