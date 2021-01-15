#!/bin/sh

ip=$(ifconfig eth0 | grep inet | sed -n -e 's/inet addr:/inet /' -e 's/^ *inet \([^ ]*\).*/\1/p;')
echo "Nginx is running on http://$ip:80"

exec nginx -g "daemon off;"
