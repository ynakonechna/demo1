FROM node:latest

WORKDIR /usr/src/app

COPY *.json ./
COPY img ./img
COPY views ./views
COPY *.js ./

RUN npm install

EXPOSE 3000

CMD [ "node", "index.js" ]