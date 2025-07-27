FROM nginx:latest 
RUN rm -rf /usr/share/nginx/html/*
COPY roboshop.conf /etc/nginx/default.d/roboshop.conf
ADD static /usr/nginx/nginx/html/
