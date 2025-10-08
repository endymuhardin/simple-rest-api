FROM node:22-alpine

WORKDIR /usr/src/app
COPY ./app.js ./
COPY ./package.json ./

RUN ["npm", "install"]

CMD ["npm", "start"]