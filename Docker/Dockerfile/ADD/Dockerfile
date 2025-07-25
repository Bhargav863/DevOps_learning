FROM almalinux:8
# ADD also copies the files from local to the container but it has two other options.
# It have the ability to download the files from the internet and copy to the container.
# It can directly untar/unzip the files inside the container.
WORKDIR /app
ADD Dockerfile .
ADD https://roboshop-builds.s3.amazonaws.com/web.zip .

# Once the container is created, login to the container and see the files.