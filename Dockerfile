FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# See nginx container README that says where to save stuff. Also default CMD is already set
COPY --from=0 /app/build /usr/share/nginx/html

