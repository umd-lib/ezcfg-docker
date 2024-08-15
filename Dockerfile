# Use the official Apache HTTP Server image
FROM httpd:2.4

# Install Perl, necessary modules, and build tools
RUN apt-get update && \
    apt-get install -y perl libapache2-mod-perl2 build-essential curl \
                       libmariadb-dev libdbd-mysql-perl libdbd-mariadb-perl vim procps && \
    curl -L https://cpanmin.us | perl - App::cpanminus && \
    cpanm --notest CGI DBI DBD::MariaDB

# Copy your Apache configuration files
COPY conf/ /usr/local/apache2/conf/
# COPY conf/apache24.conf /usr/local/apache2/conf/apache24.conf
# COPY conf/passwd_ezcfg /usr/local/apache2/conf/passwd_ezcfg

# Copy your website files
COPY html/ /usr/local/apache2/htdocs/
COPY cgi-bin/ /usr/local/apache2/cgi-bin/




# Ensure the CGI script has execute permissions
RUN chmod +x /usr/local/apache2/cgi-bin/ezcfg

# Set the working directory
WORKDIR /usr/local/apache2

# Expose port 80
EXPOSE 80

# Start the Apache service
CMD ["httpd-foreground"]




# project-root/
# │
# ├── Dockerfile
# │
# ├── conf/
# │   ├── httpd.conf
# │   ├── apache24.conf
# │   └── passwd_ezcfg
# │
# ├── html/
# │   ├── index.html
# │   └── toolbar.html
# │
# └── cgi-bin/
#     └── ezcfg