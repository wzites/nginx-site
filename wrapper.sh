#!/bin/sh

ip=$(ifconfig eth0 | grep inet | sed -n -e 's/inet addr:/inet /' -e 's/^ *inet \([^ ]*\).*/\1/p;')
echo "Your website is running at http://$ip/"

exec nginx -g "daemon off;"
