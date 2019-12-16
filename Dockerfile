FROM node:8.16.2-jessie-slim

RUN apt-get update && apt-get install -y apt-transport-https make git-core

RUN cd / \
    && git clone https://github.com/cnodejs/nodeclub.git nodeclub \
    && rm -rf nodeclub/.git

RUN cd /nodeclub \
    && make install

WORKDIR /nodeclub
CMD ["node", "app.js"]