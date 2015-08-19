FROM profideo/php52

MAINTAINER Alban Duval <aduval@profideo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# install apache
RUN apt-get install -y apache2
RUN a2enmod rewrite
RUN echo "umask 002" >> /etc/apache2/envvars

# PHP5.2 for apache
RUN echo "\nPackage: libapache2-mod-php5" >> /etc/apt/preferences.d/lenny
RUN echo "Pin: release n=lenny*" >> /etc/apt/preferences.d/lenny
RUN echo "Pin-Priority: 999" >> /etc/apt/preferences.d/lenny
RUN apt-get install -y libapache2-mod-php5

# Add user profideo to group www-data
RUN usermod -a -G www-data profideo

EXPOSE 80 443

CMD /usr/sbin/apache2ctl -D FOREGROUND
