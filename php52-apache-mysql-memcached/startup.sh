#/bin/bash

start_mysqld() {
    /usr/bin/mysqld_safe > /dev/null 2>&1 &

    for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14; do
        sleep 1
        if mysqld_status check_alive nowarn ; then break; fi
    done
}

[ -d /opt/mysql/mysqld ] || mkdir -p /opt/mysql/mysqld
[ -d /opt/mysql/logs ] || mkdir -p /opt/mysql/logs

chown -R mysql-user:root /opt/mysql/

# to install or start mysql daemon
if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db

    start_mysqld

    #echo "Give me the database username..."
    #read USERNAME

    #echo "Now give me the database plaintext password..."
    #read -s USERPASSWORD
    USERNAME=username
    PASSWORD=password

    echo "CREATE USER '$USERNAME'@'%';
    SET PASSWORD FOR '$USERNAME'@'%' = PASSWORD('$PASSWORD');
    GRANT ALL ON *.* TO $USERNAME@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    quit;" | mysql
else
    start_mysqld
fi

# start memcached
memcached -d -u root -m 1024

# start apache daemon
/usr/sbin/apache2ctl start


# make container run forever
while true; do sleep 1000; done
