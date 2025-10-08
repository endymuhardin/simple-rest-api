FROM node:22-alpine

WORKDIR /usr/src/app
COPY ./app.js ./
COPY ./package.json ./

RUN ["npm", "install"]

ENTRYPOINT ["node", "/usr/src/app/app.js"]