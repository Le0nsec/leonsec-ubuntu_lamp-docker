#!/bin/bash
mysqladmin -uroot password 'root'
mysql -e 'source /db.sql' -uroot -proot
service apache2 start
chown -R www-data:www-data /app
rm -f /db.sql
#flag
export FLAG=flag{test_xxxxx}
echo $FLAG > /flag
export FLAG=no
FLAG=no
rm -f /flag.sh