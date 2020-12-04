FROM php:7.2
WORKDIR /var/www/html/symfonyapp
COPY . .

RUN apt-get update -qy && \
    apt-get install -qq --no-install-recommends wget apt-transport-https lsb-release ca-certificates yamllint rsync npm git ssh && \			
	apt-get install -qq --no-install-recommends libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev && \
	docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir && \
	docker-php-ext-install zip gd && \
	docker-php-ext-enable zip gd && \
	wget https://getcomposer.org/download/1.10.17/composer.phar -O ./composer && \
	mv composer /usr/local/bin/composer && \
	chmod a+x /usr/local/bin/composer && \
	wget https://cs.symfony.com/download/php-cs-fixer-v2.phar -O php-cs-fixer-v2.phar && \
	mv php-cs-fixer-v2.phar /usr/local/bin/php-cs-fixer-v2 && \
	npm install -g grunt 

CMD ["/bin/bash"]
    