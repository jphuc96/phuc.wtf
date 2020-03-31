# FROM klakegg/hugo:0.68.3 AS hugo
# COPY . /hugo
# WORKDIR /hugo
# # RUN hugo
# CMD ["server","--environment=production","--bind=0.0.0.0", "--appendPort=false","--port=80", "--baseURL=https://phuc.wtf/"]

FROM klakegg/hugo:0.68.3 AS HUGOINSTALL 
COPY . /hugo-site
WORKDIR /hugo-site
RUN hugo --environment=production --baseURL=https://phuc.wtf/

FROM nginx:stable-alpine
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html
COPY --from=HUGOINSTALL /target /usr/share/nginx/html
EXPOSE 80