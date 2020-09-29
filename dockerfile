FROM node:12

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install -g react-360-cli

RUN react-360 init ssinghfbrlr360
	
COPY ssinghfbrlr360 .

EXPOSE 8081
CMD [ "npm", "start" ]