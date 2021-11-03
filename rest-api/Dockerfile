# [Choice] Node.js version (use -bullseye variants on local arm64/Apple Silicon): 16, 14, 12, 16-bullseye, 14-bullseye, 12-bullseye, 16-buster, 14-buster, 12-buster
ARG VARIANT=17.0.1-bullseye
FROM node:${VARIANT}

RUN npm install -g editorconfig @nestjs/cli

RUN mkdir -p /workspace
WORKDIR /workspace
COPY . /workspace
RUN npm install

CMD [ "npm", "run", "start:dev" ]
