# FROM klakegg/hugo:0.68.3 AS hugo
# COPY . /hugo
# WORKDIR /hugo
# CMD ["server","--environment=production","--bind=0.0.0.0", "--appendPort=false","--port=80", "--baseURL=https://phuc.wtf/"]

FROM klakegg/hugo:0.68.3-onbuild AS HUGOINSTALL 

COPY . /hugo
WORKDIR /hugo
RUN hugo --baseURL=https://phuc.wtf/

FROM nginx:stable-alpine
COPY --from=HUGOINSTALL /target /usr/share/nginx/html
# COPY ./nginx.conf /etc/nginx/conf.d/phuc.wtf.conf
EXPOSE 80