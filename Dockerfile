FROM klakegg/hugo:0.68.3 AS hugo
COPY . /src
CMD ["server", "--appendPort=false","--port=80", "--baseURL=https://phuc.wtf/"]

# FROM klakegg/hugo:0.68.3-onbuild AS hugo 

# COPY . /src
# RUN hugo --baseURL=https://phuc.wtf/

# FROM nginx:stable-alpine
# COPY --from=hugo /target /var/www/phuc.wtf/public
# COPY ./nginx.conf /etc/nginx/conf.d/
# EXPOSE 80