FROM ubuntu
COPY  vetstoria_dep.sh /vetstoria_dep.sh
RUN /vetstoria_dep.sh
ADD /var/www/html/oabp /my_project/oabp
ADD /etc/mysql/ /my_project/mysql/
VOLUME /my_project
EXPOSE 80
EXPOSE 3306
