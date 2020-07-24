FROM openjdk:11.0.5-jdk-slim as BUILDER
WORKDIR /petclinic
COPY .mvn /petclinic/.mvn
COPY pom.xml /petclinic/pom.xl
COPY mvnw /petclinic/mvnw
RUN chmod +x mvnw
RUN ./mvn dependency:go-offline
COPY src /petclinic/src
RUN ./mvnw package -DskipTests

FROM openjdk:11-jre-slim
COPY-- from=BUILDER /petclinic/target/*.jar /spring-petclinic.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/spring-petclinic.jar"]
