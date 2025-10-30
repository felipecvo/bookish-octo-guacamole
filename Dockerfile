# =========================
# 1️⃣ Build Stage
# =========================
FROM gradle:8.14-jdk21 AS builder

WORKDIR /home/gradle/app

# Copy only build scripts first to cache dependencies
COPY build.gradle settings.gradle ./
COPY gradle ./gradle
RUN gradle dependencies --no-daemon || return 0

# Copy source and build the jar
COPY . .
RUN gradle clean bootJar --no-daemon

# =========================
# 2️⃣ Run Stage (Distroless)
# =========================
FROM gcr.io/distroless/java21:nonroot

WORKDIR /app
COPY --from=builder /home/gradle/app/build/libs/*.jar app.jar

USER nonroot

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
