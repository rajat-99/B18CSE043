FROM ubuntu

RUN apt update
RUN apt -y install nodejs
RUN apt -y install npm

ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

EXPOSE 3000

CMD [ "nodejs", "app.js" ]
