FROM node:8.16.2-jessie-slim

ADD ./app /nodeclub
WORKDIR /nodeclub

RUN apt-get update \
    && apt-get install make

RUN cd /nodeclub \
    && make install

CMD ["node", "app.js"]