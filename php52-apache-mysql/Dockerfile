FROM profideo/php52-apache

MAINTAINER Porawit Poboonma <ball6847@gmail.com>

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get -y install mysql-client mysql-server

RUN useradd -u 9876 mysql-user

RUN mv /etc/mysql/conf.d/mysqld_safe_syslog.cnf /etc/mysql/conf.d/mysqld_safe_log.cnf
RUN mkdir -p /opt/mysql/mysqld
RUN mkdir -p /opt/mysql/logging
RUN chown mysql-user:root /opt/mysql/

# actually this should be done in profideo/php52-apache but it do not own the repository
# may working on my own image later
RUN chown www-data:root /var/lock/apache2/

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
RUN sed -i -re"s/^(.+)\s*=\s*\/var\/run\/mysqld\/(.+[\.pid | \.sock])$/\1= \/opt\/mysql\/mysqld\/\2/" /etc/mysql/my.cnf
RUN sed -i -e"s/^.*user\s*=\s*mysql.*$/user = mysql-user/" /etc/mysql/my.cnf

RUN sed -i -re"s/^(.+)\s*=\s*\/var\/run\/mysqld\/(.+[\.pid | \.sock])$/\1= \/opt\/mysql\/mysqld\/\2/" /etc/mysql/debian.cnf

RUN sed -i -e"s/^.*syslog.*$/log-error=\/opt\/mysql\/logging\/mysqld-error.log/" /etc/mysql/conf.d/mysqld_safe_log.cnf

ADD ./startup.sh /opt/startup.sh

EXPOSE 3306
VOLUME ["/var/lib/mysql", "/opt/mysql/mysqld", "/opt/mysql/logging"]

CMD ["/bin/bash", "/opt/startup.sh"]
