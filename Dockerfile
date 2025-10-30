FROM gradle:8.14-jdk21 AS builder

WORKDIR /home/gradle/app

COPY build.gradle.kts settings.gradle.kts ./
COPY gradle ./gradle
RUN gradle dependencies --no-daemon || return 0

COPY . .
RUN gradle clean bootJar --no-daemon

FROM gcr.io/distroless/java21:nonroot

WORKDIR /app
COPY --from=builder /home/gradle/app/build/libs/*.jar app.jar

USER nonroot

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
