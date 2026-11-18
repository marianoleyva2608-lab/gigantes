FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
COPY cubeteros /usr/share/nginx/html/cubeteros
COPY requisiciones /usr/share/nginx/html/requisiciones
COPY docs /usr/share/nginx/html/docs
EXPOSE 80
