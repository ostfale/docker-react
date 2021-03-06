FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build  # output in /app/build

# second step starts with FROM
FROM nginx  
COPY --from=builder /app/build /usr/share/nginx/html



