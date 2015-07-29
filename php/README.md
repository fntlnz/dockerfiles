# PHP

Latest Stable Version: **5.6.11**
Latest Beta Version: **7.0.0beta2**

PHP Docker images compiled from source.

Available versions on Docker Hub

- 7.0.0beta2
- 7.0.0beta1
- 7.0.0alpha2
- 7.0.0alpha1
- 5.6.11
- 5.6.10
- 5.6.9
- 5.6.8
- 5.6.7
- 5.6.6
- 5.5.27
- 5.5.16
- 5.4.43

## Get it

```
docker pull fntlnz/php-fpm
```

## Examples

### PHP version

```
docker run --rm fntlnz/php:7.0.0beta2 php -v
PHP 7.0.0beta2 (cli) (built: Jul 25 2015 20:16:57) 
Copyright (c) 1997-2015 The PHP Group
Zend Engine v3.0.0-dev, Copyright (c) 1998-2015 Zend Technologies
```


## Volumes
- `/usr/local/php/etc`


## Build

Build a specific version
```
./build.sh <version>
```