# stage BASE
FROM node:12.10-alpine AS base

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# stage PRODUCTION
FROM node:12.10-alpine AS production

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
RUN yarn install --production && yarn cache clean
COPY --from=base /usr/src/app/dist ./dist

EXPOSE 3000
CMD ["yarn", "start"]
