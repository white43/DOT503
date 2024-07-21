FROM bellsoft/liberica-openjdk-alpine:21

RUN apk --no-cache add tini

COPY build/libs/app.jar /app/

EXPOSE 8088

CMD ["tini", "java", "-jar", "/app/app.jar"]