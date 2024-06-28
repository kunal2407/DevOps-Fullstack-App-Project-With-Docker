# Use Ubuntu 20.04 as the base image
FROM ubuntu:latest

# Set environment variables for non-interactive apt installs
ENV DB_HOST="DB_host_ip_or_DNS" 
ENV DB_USER="User_Name" 
ENV DB_PASSWORD="User_Password" 
ENV DB_NAME="Database_Name" 
ENV DB_PORT="5432" 
ENV ALLOWED_ORIGINS="http://Frontend_Pub_ip:3000"

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

# Create the Go working directory
RUN mkdir -p /home/ubuntu/project

# Set the working directory
WORKDIR /home/ubuntu/project

# Copy the Go application code to the container
COPY . .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the Go application
CMD ["go", "run", "main.go"]
