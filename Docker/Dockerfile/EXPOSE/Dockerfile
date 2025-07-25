FROM almalinux:8
RUN yum install nginx -y
# Expose won't add any functionality. It is used to provide information that which port needs to be exposed while running a container.
# The EXPOSE instruction doesn't actually publish the port. 
# It functions as a type of documentation between the person who builds the image and the person who runs the container, about which ports are intended to be published.
EXPOSE 80/tcp
CMD [ "nginx", "-g", "daemon off;"]