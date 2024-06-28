# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables for non-interactive apt installs
ENV DB_HOST=<POSTGRES_HOST> 
ENV DB_USER=<POSTGRES_USER> 
ENV DB_PASSWORD=<POSTGRES_PASSWORD> 
ENV DB_NAME=<POSTGRES_DB_NAME> 
ENV DB_PORT=<POSTGRES_PORT> 
ENV ALLOWED_ORIGINS=<ALLOWED_ORGINS_VALUE>

# Set Go environment variables
ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Update and install dependencies
RUN sudo apt-get update && \
    sudo apt-get install -y wget git build-essential

# Install Go
RUN sudo curl -O https://dl.google.com/go/go1.19.linux-amd64.tar.gz
    sudo tar -xvf go1.19.linux-amd64.tar.gz
    sudo mv go /usr/local
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    sudo snap install go --classic

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
