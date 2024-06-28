# Use Ubuntu 20.04 as the base image
FROM ubuntu:latest

# Set environment variables for non-interactive apt installs
ENV DB_HOST=<POSTGRES_HOST> 
ENV DB_USER=<POSTGRES_USER> 
ENV DB_PASSWORD=<POSTGRES_PASSWORD> 
ENV DB_NAME=<POSTGRES_DB_NAME>
# ENV DB_PORT=<POSTGRES_PORT> Here we mention our Database which created in it that is (employee)
ENV DB_PORT=<POSTGRES_PORT> 
# ENV ALLOWED_ORIGINS=<ALLOWED_ORGINS_VALUE> Here We Mention our Frontend Public IP
ENV ALLOWED_ORIGINS=<ALLOWED_ORGINS_VALUE>
# Set Go environment variables
ENV GOPATH=/go
ENV GOROOT=/usr/local/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Update and install dependencies
RUN apt-get update && \
    apt-get install -y wget git build-essential

# Install Go
RUN wget https://golang.org/dl/go1.19.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz && \
    rm go1.19.linux-amd64.tar.gz

# Install Go using snap (optional, uncomment if needed)
# RUN snap install go --classic

# Create the Go working directory
RUN mkdir -p /home/ubuntu/project

# Set the working directory
WORKDIR /home/ubuntu/project

# Copy the Go application code to the container
COPY . .

# Copy the initialization script to the Docker entrypoint initdb.d directory
COPY init-db.sh /docker-entrypoint-initdb.d/

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the Go application
CMD ["go", "run", "main.go"]
