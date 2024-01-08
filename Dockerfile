FROM node:20-alpine3.18

ENV PORT=3000

WORKDIR /bookapp-react-js
COPY . /bookapp-react-js
RUN npm run build
EXPOSE ${PORT}
CMD ["npm", "start"]


FROM nginx:1.24-alpine as prod-stage
COPY --from=build-stage /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]