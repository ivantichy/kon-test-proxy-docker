FROM nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 8080 8082
