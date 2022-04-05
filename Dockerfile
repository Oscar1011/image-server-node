FROM node:12

WORKDIR /app

COPY . .
RUN npm install

RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"] 
