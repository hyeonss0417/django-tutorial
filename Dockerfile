FROM centos:centos7

RUN yum install -y http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm
RUN yum install -y python-pip python-devel nginx gcc mysql-devel

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD mysite.conf /etc/nginx/conf.d/mysite.conf

RUN pip install django gunicorn MySQL-python

ADD ./ /var/www/mysite
WORKDIR /var/www/mysite
RUN chmod +x entrypoint.sh

EXPOSE 80

ENTRYPOINT ./entrypoint.sh


