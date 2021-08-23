#!/bin/bash
sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/wmadison.config
service nginx reload
echo "autoindex on"