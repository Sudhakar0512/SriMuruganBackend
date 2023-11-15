FROM maven:3-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build target/sb_srimurugan.jar SriMuruganServerfinal.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","SriMuruganServerfinal.jar"]
