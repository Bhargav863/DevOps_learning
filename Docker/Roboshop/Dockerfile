FROM nginx:latest 
RUN rm -rf /usr/share/nginx/html/*
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY roboshop.conf /etc/nginx/default.d/roboshop.conf
ADD static /usr/nginx/nginx/html/

