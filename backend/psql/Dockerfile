# Use the official PostgreSQL image from the Docker Hub
FROM postgres:latest

# Environment variables for PostgreSQL
ENV POSTGRES_DB=employees
ENV POSTGRES_USER=test
ENV POSTGRES_PASSWORD=1234

# Copy initialization SQL script to the Docker image
COPY init-db.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432
