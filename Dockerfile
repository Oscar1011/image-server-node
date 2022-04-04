FROM node:12

# If possible, run your container using `docker run --init`
# Otherwise, you can use `tini`:
# RUN apk add --no-cache tini
# ENTRYPOINT ["/sbin/tini", "--"]


WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# If you have native dependencies, you'll need extra tools
# RUN apk add --no-cache make gcc g++ python3

#RUN npm ci --prod

CMD ["node", "app.js"]
