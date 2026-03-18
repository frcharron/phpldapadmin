FROM phpldapadmin/phpldapadmin:latest

# Remplace simplement le Caddyfile principal
COPY Caddyfile /etc/Caddyfile
