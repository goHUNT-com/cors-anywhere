FROM node:12.15.0-buster-slim
EXPOSE 8080
RUN apt update -y && \
    apt install jq awscli -y
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app/
RUN touch .env
COPY package.json ./
RUN npm install
COPY . .
ENTRYPOINT ["node", "server.js"]
