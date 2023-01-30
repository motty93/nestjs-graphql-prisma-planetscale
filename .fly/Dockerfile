# builder
FROM node:18-alpine as builder

ENV NODE_ENV development

WORKDIR /app

COPY . ./

RUN yarn install && \
    yarn prisma generate && \
    yarn build

# entrypoint
FROM node:18-alpine

ENV NODE_ENV production

WORKDIR /app

COPY --from=builder /app/node_modules/ ./node_modules/
COPY --from=bulider /app/package.json ./
COPY --from=builder /app/yarn.lock ./
COPY --from=builder /app/dist ./dist

RUN yarn prisma db push
CMD ["node", "dist/src/main"]
