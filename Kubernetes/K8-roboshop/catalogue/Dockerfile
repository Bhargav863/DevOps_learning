FROM node:14.21.3-alpine3.17
EXPOSE 8080
WORKDIR /opt/server
COPY static .
RUN npm install 
CMD [ "node","server.js" ]
