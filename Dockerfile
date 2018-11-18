FROM nginx:stable-alpine

COPY entrypoint.sh /
COPY proxy.conf /etc/nginx/conf.d/

RUN chmod +x /entrypoint.sh \
 && sed -i 's/user  nginx;/user  root;/' /etc/nginx/nginx.conf

ENV CA_CRT=""
ENV SERVER_KEY=""
ENV SERVER_CRT=""
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 2376