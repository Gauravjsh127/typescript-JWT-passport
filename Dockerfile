FROM node:carbon

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_ENV production

WORKDIR /home/node/app

ADD . /home/node/app

ADD dist /home/node/app/dist
ADD package.json /home/node/app/package.json

ENV MONGODB_URI mongodb://db:27017
ENV JWT_SECRET ashdfjhasdlkjfhalksdjhflak
ENV SALT_SECRET 8

RUN chown -R node:node /home/node/app 

USER node


RUN npm install --save

EXPOSE 3000

#CMD node dist/server.js
CMD npm run watch
