FROM	debian:buster
COPY	./srcs/. ./tmp
RUN		mv /tmp/autoindex_on.sh .. && mv /tmp/autoindex_off.sh ..
EXPOSE	80 443
CMD		sh ./tmp/run.sh && /bin/bash