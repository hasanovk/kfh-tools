#!/bin/sh
# Written by Karshi Hasanov
# Last modified : October 23, 2015
if [ ${1} = "-h" ] || [ ${1} = "--help" ] 
	then
	     echo "
	     Usage: => modify <alias name>
	     Example: To modify the Apache config file. you can issue
	              the following command
		      => modify_config httpd.conf
		      => modify_config apache 
		      => modify_config http

		      # alias -> vim /usr/local/etc/apache24/httpd.conf
             To see the aliases: => modify_config --show -aliases 
	                         => modify_config -sa
	     "
	     exit 0

elif [ ${1} = "--show-aliases" ] || [ ${1} = "-sa" ] 
	then
	     echo "
	     # Apache Server Config File :
	     httpd.conf --> /usr/local/etc/apache24/httpd.conf
	     Aliases: apache, http, httpd and httpd.conf

             # Apache Server Virtual Hosts Config File:
	     httpd-vhosts.conf --> /usr/local/etc/apache24/extra/httpd-vhosts.conf
             Aliases: vhosts, virtual-hosts, vh, vhosts.conf ,and httpd-vhosts.conf

	     # Apache Server SSL Support for Virtual Hosts
	     httpd-ssl.conf --> /usr/local/etc/apache24/extra/httpd-ssl.conf
	     Aliases: vhost-ssl, httpd-ssl, http-ssl and httpd-ssl.conf

	     # PHP main configuration file: php.ini - responsible for PHP's behavior.
	     php.ini --> /usr/local/etc/php.ini
	     Aliases: php.ini, phpconf,viphp

	     # DNS Server
	     named.conf --> /usr/local/etc/namedb/named.conf
	     Aliases: named.conf, dns.conf, dns-main.conf

	     forward_karshi.ca --> /usr/local/etc/namedb/master/forward_karshi.ca
	     Aliases: forward-dns, forward_dns, fdns
	     
	     reverse_karshi.ca --> /usr/local/etc/namedb/master/reverse_karshi.ca
	     Aliases: reverse-dns, reverse_dns, rdns

	     nginx.conf --> /usr/local/etc/nginx/nginx.conf
	     Aliases: nginx.conf, nginx, Nginx
	     
	     postgre.conf --> /var/db/postgres/data96/postgresql.conf
	     Aliases: postgresql postgres
	     
	     pg_hba.conf --> /var/db/postgres/data96/pg_hba.conf
	     Aliases: pg_hba pg hba

	     "
	     
fi

		      
check ()
	{
	   if [ "$(id -u)" != "0" ]; then
		echo " ---> The program requires the root privileges"
	        exit 1
           fi
   }

case "${1}" in
    
	"httpd.conf"|"apache"|"http"|"httpd")
		check && sudo vim /usr/local/etc/apache24/httpd.conf;;
	"httpd-vhosts.conf"|"vhosts.conf"|"vhosts"|"virtual-hosts"|"vh")
		check && sudo vim /usr/local/etc/apache24/extra/httpd-vhosts.conf;;
	"httpd-ssl.conf"|"vhost-ssl"|"httpd-ssl"|"http-ssl")
		check && sudo vim /usr/local/etc/apache24/extra/httpd-ssl.conf;;
	"php.ini"|"phpconf"|"viphp")
		check && sudo vim /usr/local/etc/php.ini;;
	"named.conf"|"dns.conf"|"dns-main.conf")
		check && sudo vim /usr/local/etc/namedb/named.conf;;
	"forward-dns"|"forward_dns"|"fdns")
		check && sudo vim /usr/local/etc/namedb/master/forward_karshi.ca;;
	"reverse-dns"|"reverse_dns"|"rdns")
		check && sudo vim /usr/local/etc/namedb/master/reverse_karshi.ca;;
	"nginx.conf"|"nginx"|"Nginx")
		check && sudo vim /usr/local/etc/nginx/nginx.conf;;
	
	"postgres"|"postgresql")
		check && sudo vim /var/db/postgres/data96/postgresql.conf;;
	
	"pg_hba"|"pg"|"hba")
		check && sudo vim /var/db/postgres/data96/pg_hba.conf;;
esac

	 
