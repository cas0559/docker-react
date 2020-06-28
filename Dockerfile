FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# See nginx container README that says where to save stuff. Also default CMD is already set
COPY --from=builder /app/build /usr/share/nginx/html

