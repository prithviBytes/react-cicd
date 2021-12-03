# Build Phase
FROM node:16-alpine as builder
USER node
RUN mkdir -p /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node ./package.json ./
RUN npm install
COPY . .
RUN npm run build

# Serve Phase

FROM nginx
COPY --from=builder /home/node/app/build /user/share/nginx/html
