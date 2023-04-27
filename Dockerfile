FROM node:18-alpine
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build
EXPOSE 3000
CMD ["node", "build"]


# download docker, lav profil duckerhub, køre "docker build . -t innocloud . docker push" (publish to docker hub )