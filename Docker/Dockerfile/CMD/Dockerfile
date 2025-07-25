FROM almalinux:8
RUN yum install nginx -y 
# The CMD instruction sets the command to be executed when running a container from an image.
# CMD is used to run the commands inside the container, It will only run the commands only at the time of container creation.
# There can only be one CMD instruction in a Dockerfile. If you list more than one CMD, only the last one takes effect.
RUN echo "Welcome to the Docker file,a way of creating images"
CMD [ "nginx", "-g", "daemon off";]
