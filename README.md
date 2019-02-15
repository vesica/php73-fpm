[![CircleCI](https://circleci.com/gh/vesica/php73-fpm.svg?style=shield)](https://circleci.com/gh/vesica/php73-fpm)
[![](https://img.shields.io/docker/pulls/vesica/php73-fpm.svg)](https://cloud.docker.com/u/vesica/repository/docker/vesica/php73-fpm)
[![](https://img.shields.io/github/license/vesica/php73-fpm.svg)](https://github.com/vesica/php73-fpm/blob/master/LICENSE.txt)

# PHP 7.3 Docker Image with FPM

This repository produces a PHP 7.3 Image with FPM, ready for production use.

It is based on the official PHP 7.3 Docker Image and runs Debian.

It will work with OpenShift Online, Sloppy.io or any other Docker hosts.

FPM is exposed on Port 9000.

## Pull from Docker Hub to use

For production use, without XDebug:

```
docker run -d -p 8080:8080 -it --name=php -v $(pwd)/var/www/html:/var/www/html vesica/php73-fpm:latest
```

or with XDebug:
```
docker run -d -p 8080:8080 -it --name=php -v $(pwd)/var/www/html:/var/www/html vesica/php73-fpm:dev
```

## Build to use as a development environment (i.e., with XDebug):
```
docker build -f Dockerfile.dev . -t php73-fpm:dev
docker run -d -p 8080:8080 -it --name=php -v $(pwd)/var/www/html:/var/www/html php73-fpm:dev
```

## Build to use as a production environment:
```
docker build -f Dockerfile . -t php73
docker run -d -p 8080:8080 -it --name=php -v $(pwd)/var/www/html:/var/www/html php73
```


## Publish Images
Docker images are automatically published to vesica/php73-fpm:latest and vesica/php73-fpm:dev.


## Important Information:

### FPM Settings

Coming soon.

### PHP Modules and Extensions
 
The following modules / extensions / PECLs are enabled on this container (excluding XDebug which is only available in the :dev tag):

#### Extensions
* calendar
* iconv 
* bcmath 
* xml 
* gd 
* mbstring 
* pdo 
* tidy 
* gettext 
* intl 
* pdo 
* pdo_mysql 
* mysqli 
* simplexml 
* tokenizer 
* xml 
* xmlwriter 
* zip
* exif
* opcache

#### PECLs
* Redis
* GeoIP
* Memcached
* TimezoneDB
* APCu

## Need something else added?

Raise a pull request or an issue.

## License
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
