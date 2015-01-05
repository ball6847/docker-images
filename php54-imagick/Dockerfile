FROM profideo/php54

MAINTAINER Alban Duval <aduval@profideo.com>

# Install imagemagick
RUN apt-get install -y imagemagick
RUN apt-get install -y librsvg2-2 librsvg2-bin librsvg2-dbg
RUN apt-get install -y libmagickcore5 libmagickcore5-extra libmagickcore5 libmagickcore5-extra
RUN apt-get install -y mysql-client

COPY ./files/achillefy-regular_l-webfont.ttf /usr/share/fonts/achillefy-regular_l-webfont.ttf
COPY ./files/type-achille.xml /etc/ImageMagick/type-achille.xml
COPY ./files/type.xml /etc/ImageMagick/type.xml

RUN fc-cache -f -v
