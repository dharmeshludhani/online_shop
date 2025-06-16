FROM node:latest as build

WORKDIR /app

COPY . /app

RUN npm ci 

RUN npm run build 

#=========================================

FROM node:22-alpine

WORKDIR /app

COPY --from=build /app /app

CMD ["npm","start"]
