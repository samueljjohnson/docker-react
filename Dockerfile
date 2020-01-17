#Base
FROM node:alpine as builder
#Additional config
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
#Command to run
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html