#!/bin/bash
sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/wmadison.config
service nginx reload
echo "autoindex off"