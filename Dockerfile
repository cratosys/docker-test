FROM ubuntu:16.04
FROM node:10

WORKDIR /
COPY ./ ./
RUN npm install
#RUN npm install pm2 -g

EXPOSE 3030 
EXPOSE 4040

ENTRYPOINT ["pm2-runtime", "--format", "start"]
CMD ["process.json"]

FROM nginx:latest
COPY ./nginx.conf /etc/nginx/nginx.conf

#CMD ["pm2-runtime","--format","start","process.json"]



