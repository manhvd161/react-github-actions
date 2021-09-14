FROM node:14.17-alpine AS base
WORKDIR /app
COPY package.json .

FROM base AS dependencies
RUN npm i --production

FROM node:14.17-alpine
WORKDIR /app
COPY --from=dependencies /app .
COPY . .
# RUN npm run build
CMD [ "npm", "start" ]
