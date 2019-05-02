FROM node:alpine
RUN apk add python make g++
COPY . .
EXPOSE 8080
RUN npm i
CMD [ "npm", "start" ]
