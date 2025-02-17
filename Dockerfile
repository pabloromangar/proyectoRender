# Usar imagen base de Java
FROM openjdk:17-jdk-slim AS build

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos del proyecto
COPY . .

# Dar permisos de ejecución al archivo mvnw
RUN chmod +x ./mvnw

# Construir la aplicación con Maven y generar el WAR
RUN ./mvnw clean package -DskipTests

# Segunda etapa: Imagen final para ejecución
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copiar el WAR generado en target/
COPY --from=build /app/target/*.war app.war

# Exponer el puerto de la aplicación
EXPOSE 8080

# Ejecutar la aplicación con el WAR
CMD ["java", "-jar", "app.war"]
