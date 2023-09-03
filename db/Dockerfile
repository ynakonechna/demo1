FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=nuwmhostels
ENV MYSQL_USER=student
ENV MYSQL_PASSWORD=123456
ENV LANG=C.UTF-8

COPY nuwmhostels_30.10.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
