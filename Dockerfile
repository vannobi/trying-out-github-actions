FROM node:14 as builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN yarn

COPY . .

RUN yarn build

FROM nginx

EXPOSE 80

COPY --from=build /app/build /usr/share/nginx/html