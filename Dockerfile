FROM nginx

RUN apt-get update && apt-get install -y net-tools

COPY wrapper.sh /

COPY html /usr/share/nginx/html

EXPOSE 80
CMD ["./wrapper.sh"]
