# Use the official Ubuntu base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /usr/src/app

# Install Node.js and npm
RUN sudo apt-get update && \
    sudo apt-get install -y nodejs npm && \
    sudo npm install -g n && \
    sudo n 14.17.0 && \
    node -v

# Copy package.json and package-lock.json files
COPY package*.json ./
COPY .env ./
# Copy the rest of the application code
COPY . .

# Install application dependencies
RUN npm install

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
