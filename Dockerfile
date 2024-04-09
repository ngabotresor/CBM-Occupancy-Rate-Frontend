FROM node:18-alpine as build

WORKDIR /app

COPY . .

RUN npm install

COPY . .

RUN npm run build

FROM node:carbon

RUN npm install -g serve

WORKDIR /app

COPY --from=build /app/build ./build

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]