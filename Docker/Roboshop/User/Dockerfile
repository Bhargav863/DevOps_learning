FROM node:14
EXPOSE 8080
WORKDIR /opt/server
COPY package.json .
COPY server.json .
RUN npm install
ENV MONGO=true
CMD [ "node", "server.js" ]

