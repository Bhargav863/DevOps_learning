# FROM almalinux:8

# # An ENTRYPOINT allows you to configure a container that will run as an executable

# RUN yum install nginx -y 
# RUN rm -rf /usr/share/nginx/html/index.html
# RUN echo "Hello, welcome to the ENTRYPOINT, a way of running executable inside a container" > /usr/share/nginx/html/index.html
# ENTRYPOINT [ "nginx", "-g" , "daemon off;" ]
# ---------------------------------------------------------------------------------------------
# Overriding ENTRYPOINT (It will append to entrypoint)
# ---------------------------------------------------------------------------------------------
# FROM almalinux:8
# ENTRYPOINT [ "ping", "-c5" ]

#----------------------------------------------------------------------------------------------
# For best results combine both ENTRYPOINT and CMD
#----------------------------------------------------------------------------------------------
FROM almalinux:8
CMD [ "google.com" ]
ENTRYPOINT [ "ping", "-c5" ]

# CMD will pass the argument if user won't pass any argument