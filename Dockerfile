FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY cubeteros /usr/share/nginx/html/cubeteros
COPY requisiciones /usr/share/nginx/html/requisiciones
EXPOSE 80
