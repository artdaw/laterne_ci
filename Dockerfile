FROM node:8-slim

LABEL maintainer="Gleb Galkin <artdaw@gmail.com>"

# Install utilities
RUN apt-get update --fix-missing && apt-get -y upgrade

# Install latest chrome dev package.
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install -y google-chrome-unstable --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /src/*.deb

RUN npm i lighthouse@next -g

# Add a chrome user and setup home dir.
RUN groupadd --system chrome && \
  useradd --system --create-home --gid chrome --groups audio,video chrome && \
  mkdir --parents /home/chrome/reports && \
  chown --recursive chrome:chrome /home/chrome

USER chrome

ENV CI=true

EXPOSE 8080