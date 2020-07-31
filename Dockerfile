# install-stage
FROM node:lts-alpine as install-stage

WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm install --verbose

# build-stage
FROM install-stage as build-stage

RUN npm run build

# production-stage
FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
