ARG app
ENV app=$app

FROM mhart/alpine-node
RUN apk add --update git && \
  rm -rf /tmp/* /var/cache/apk/*
RUN npm install -g npm
RUN mkdir /app && \
  cd /app && \
  git clone https://github.com/herberttung/${app}.git
RUN cd /app/${app} && \
  git checkout master && \
  git pull && \
  yarn install
WORKDIR /app/${app}
CMD ["git", "pull", "&&", "node", "app.js"]