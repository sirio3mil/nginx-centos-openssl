CENTVER="7"
OPENSSL="openssl-1.1.0e"
NGINX="nginx-1.11.10-1"
sudo yum clean all
sudo wget https://www.openssl.org/source/$OPENSSL.tar.gz -O /opt/lib/$OPENSSL.tar.gz
sudo tar -zxvf /opt/lib/open* -C /opt/lib
sudo rpm -ivh http://nginx.org/packages/mainline/centos/$CENTVER/SRPMS/$NGINX.el$CENTVER.ngx.src.rpm
sudo sed -i "s|--with-http_ssl_module|--with-http_ssl_module --with-openssl=/opt/lib/$OPENSSL|g" /root/rpmbuild/SPECS/nginx.spec
sudo rpmbuild -ba /root/rpmbuild/SPECS/nginx.spec
sudo rpm -Uvh --force /root/rpmbuild/RPMS/x86_64/$NGINX.el$CENTVER.centos.ngx.x86_64.rpm
sudo rm /opt/lib/$OPENSSL.tar.gz
