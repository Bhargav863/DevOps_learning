FROM almalinux:8
# ADD also copies the files from local to the container but it has two other options.
# It have the ability to download the files from the internet and copy to the container.
# It can directly untar/unzip the files inside the container.
WORKDIR /app
ADD Dockerfile .
ADD sample.tar .
ADD https://roboshop-builds.s3.amazonaws.com/web.zip .

#  If the tar archive is a remote URL, the archive is not extracted, but downloaded and placed at the destination.

# Once the container is created, login to the container and see the files.
# docker run -d add:v1 sleep 300 (It won't exit immediately, you will have time to check files)