FROM httpd:latest
RUN  systemctl start httpd
RUN  systemctl enable httpd
COPY ./ /var/www/html
EXPOSE 80
