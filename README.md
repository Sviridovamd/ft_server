# ft_server
This project is intended to introduce you to the basics of system and network administration. It will allow you to install a complete web server, using a deployment technology named Docker. 

![Image alt](https://github.com/Sviridovamd/ft_server/blob/master/ft_server_logo.png)

This topic is intended to introduce you to system administration. It will make you aware
of the importance of using scripts to automate your tasks. For that, you will discover
the "docker" technology and use it to install a complete web server. This server will run
multiples services: Wordpress, phpMyAdmin, and a SQL database

•You must place all the necessary files for the configuration of your server in a folder
called srcs.
•Your Dockerfile file should be at the root of your repository. It will build your
container. You can’t use docker-compose.
•All the necessary files for your WordPress website should be in the folder srcs

•You must set up a web server with Nginx, in only one docker container. The
container OS must be debian buster.
•Your web server must be able to run several services at the same time. The services
will be a WordPress website, phpMyAdmin and MySQL. You will need to make
sure your SQL database works with the WordPress and phpMyAdmin.
•Your server should be able to use the SSL protocol.
•You will have to make sure that, depending on the url, your server redirects to the
correct website.
•You will also need to make sure your server is running with an autoindex that must
be able to be disabled


![Image alt](https://github.com/Sviridovamd/ft_server/blob/master/server.png)

![Alt Text](https://github.com/Sviridovamd/ft_server/blob/master/unnamed.gif)
