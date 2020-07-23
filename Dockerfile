FROM openjdk:8-jdk-alpine
EXPOSE 8081
ARG JAR_FILE=target/spring-petclinic-*.jar 
ADD ${JAR_FILE} spring-petclinic.jar 
ENTRYPOINT ["java","-jar","/spring-petclinic.jar"]
