FROM ubuntu:latest

RUN apt-get update 
COPY ./xampp-linux-x64-8.*-installer.run /root/xampp-linux-x64-8.*-installer.run
RUN chmod a+x /root/xampp-linux-x64-8.*-installer.run && /root/xampp-linux-x64-8.*-installer.run && rm /root/xampp-linux-x64-8.*-installer.run
RUN apt-get -y install nano && apt purge --auto-remove && apt clean && rm -rf /var/lib/apt/lists/*
COPY httpd-xampp.conf /opt/lampp/etc/extra/httpd-xampp.conf
RUN mkdir /opt/lampp/htdocs/dwc/ &&  chmod -R 777 /opt/lampp/htdocs/dwc
VOLUME /opt/lampp/var/mysql

EXPOSE 80 443 3306 
CMD /opt/lampp/lampp start && tail -F /opt/lampp/logs/error_log
