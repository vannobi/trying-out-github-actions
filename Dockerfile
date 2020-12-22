FROM node:14-alpine AS build

WORKDIR /app

COPY package.json package-lock.json yarn.lock ./

RUN yarn

COPY . .

RUN ls -l

RUN yarn build

FROM nginx:1.17-alpine

COPY --from=build /app/build /usr/share/nginx/html

HEALTHCHECK CMD wget -q -O /dev/null http://localhost || exit 1