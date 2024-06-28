# Employee Management System
  It's an application to add and view employee Details.

# Backend
    backend is written in go version 1.19
    backend server starts at port 8080
  
    ## How to run
        1. Make sure you have go version 1.19 installed
        2. go get ./...
        3. DB_HOST=<POSTGRES_HOST> DB_USER=<POSTGRES_USER> DB_PASSWORD=<POSTGRES_PASSWORD> DB_NAME=<POSTGRES_DB_NAME> DB_PORT=<POSTGRES_PORT> ALLOWED_ORIGINS=<ALLOWED_ORGINS_VALUE> go run main.go

# Frontend
    Frontend is written in ReactJS
    Frontend server starts at port 3000
    
        ## How to run
            1. Make sure you have node version 14.17.0 installed
            2. npm install
            3. npm start
# Step by step explaination

## Getting started

Created in 2-tier Architecture in AWS:
1st EC2 instance : for frontend(Ubuntu)
2nd EC2 instance : for backend/sql(Ubuntu)

Created Security Group and add [5432],[8080],[3000] port at inbound rules.

# Login into Frontend Instance:

Update your instance:
```shell
sudo apt update
```
Installing Node.js to run React.js:
```shell
 sudo apt install -y nodejs npm
 sudo npm install -g n  #using nodepackagemanager you have installed a Node.js version manager that allows you to install and manage multiple versions of Node.js on your system.
 sudo n 14.17.0   #This command uses the n package installed in the previous step to install a specific version of Node.js (in this case, version 14.17.0).
 node -v
```
n is a Node.js version manager. It allows you to easily install, manage, and switch between multiple versions of Node.js on your system. With n, you can install different versions of Node.js side by side and quickly switch between them as needed for your projects or development environments.
Clone git repo:
```shell
 git clone https://github.com/shubhamkalsait/devops-fullstack-app.git
```
Go to frontend dir after all this installation and run npm start
```shell
 cd devops-fullstack-app/frontend/
 sudo vim .env #REACT_APP_SERVER_URL=http://localhost:8080/employees --> REACT_APP_SERVER_URL=http://backend_pub_ip:8080/employees
 npm install #This command is used to install dependencies listed in the package.json file of a Node.js project.
 npm start   #This command is typically used to start the application defined in the scripts section of the package.json file
```


# Login into Backend Instance:

Update your instance:
```shell
sudo apt update
```
Install Postgressql:
```shell
 sudo apt install postgresql postgresql-contrib
```
Login into Postgressql:
```shell
 sudo -u postgres psql
```
```
 PGPASSWORD=12345678 psql -h database-1.cj026e22o5gx.ap-south-1.rds.amazonaws.com -U postgres -d postgres -p 5432
```
After login create DB and User and grant permission to user into Postgressql:
Here, DB_USER=test DB_PASSWORD='1234' DB_NAME=employees 
```shell
CREATE DATABASE employees;                             
CREATE USER test WITH PASSWORD '1234';
GRANT ALL PRIVILEGES ON DATABASE employees TO test;
\c employees
GRANT USAGE ON SCHEMA public TO test;
GRANT CREATE ON SCHEMA public TO test;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO test;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO test;
\q
```

Install GO with specific v1.19:
```shell
sudo curl -O https://dl.google.com/go/go1.19.linux-amd64.tar.gz
sudo tar -xvf go1.19.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
sudo snap install go --classic
```

Clone git repo:
```shell
git clone https://github.com/shubhamkalsait/devops-fullstack-app.git
```
Go to backend dir after all this installation and run main.go
```shell
 cd devops-fullstack-app/backend/ 
 DB_HOST=<POSTGRES_HOST> DB_USER=<POSTGRES_USER> DB_PASSWORD=<POSTGRES_PASSWORD> DB_NAME=<POSTGRES_DB_NAME> DB_PORT=<POSTGRES_PORT> ALLOWED_ORIGINS=<ALLOWED_ORGINS_VALUE> go run main.go
 # sudo DB_HOST=localhost DB_USER=test DB_PASSWORD=1234 DB_NAME=employees DB_PORT=5432 ALLOWED_ORIGINS="http://frontend_ip:3000" go run main.go
```
# Hit Pubic ip of Frontend http://pub.ip:3000 fill The field and check data fill or not ...
![Screenshot (1039)](https://github.com/Shantanu20000/devops-fullstack-app-shan/assets/163661534/d979bae7-0ef1-4e64-990d-a451bd7fd734)

