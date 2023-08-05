FROM node:19-alpine3.15

ENV NODE_ENV production

WORKDIR /reddit-clone

COPY package*.json ./

RUN --mount=type=cache,target=/reddit-clone/.npm \
  npm set cache /reddit-clone/.npm && \
  npm ci --only=production

USER node

COPY --chown=node:node ./src /reddit-clone

RUN npm install 

EXPOSE 3000

CMD ["npm","run","dev"]
