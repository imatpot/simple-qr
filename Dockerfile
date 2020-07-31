# build-stage
FROM node:latest as build-stage
WORKDIR /app
COPY . .
RUN npm install \
 && npm run build

# production-stage
FROM nginx:latest as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
