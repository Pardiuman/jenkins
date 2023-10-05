FROM maven as build
WORKDIR /home/app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /home/app
COPY --from=build /home/app/target/Sample-Application.jar /home/app/
EXPOSE 9099
CMD ["java","-jar","Sample-Application.jar"]

