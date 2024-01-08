FROM node:16-alpine as builder

# set working directory
WORKDIR /app

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# start app
CMD ["npm", "run", "start"]

# expose port
EXPOSE 3000

