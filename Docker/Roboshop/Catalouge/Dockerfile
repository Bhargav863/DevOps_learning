FROM node:14 
EXPOSE 8080
WORKDIR /opt/server
COPY static .
RUN npm install 
ENV MONGO=true
CMD [ "node","server.js" ]
