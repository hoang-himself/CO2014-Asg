ARG VARIANT=17.1-bullseye

FROM node:${VARIANT}

ARG USERNAME=node

WORKDIR /usr/src/app

RUN apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install
COPY . .

RUN mkdir -p ./dist

RUN chown -R ${USERNAME} ./dist ./node_modules
USER ${USERNAME}
CMD [ "npm", "run", "start" ]
