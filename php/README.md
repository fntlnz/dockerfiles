![PHP](http://php.net/images/logo.php)

```
docker pull fntlnz/php:latest
```

| Latest Stable | Latest Release Candidate |
| ------------- |:------------------------:|
| 5.6.16        | 7.0.0RC8                 |

## Index
- [Available versions on Docker Hub](#available-versions-on-docker-hub)
- [Exposed Volumes](#exposed-volumes)
- [Examples](#examples)
   * [Get the PHP version](#get-the-php-version)
   * [Create a derivative Dockerfile to add additional PHP extensions](#create-a-derivative-dockerfile-to-add-additional-php-extensions)
- [Build](#build)
- [Pro tip](#pro-tip)

### Available versions on Docker Hub

**Stable**
- 5.6.16 - *latest*
- 5.6.15
- 5.6.14
- 5.6.13
- 5.6.12
- 5.6.11
- 5.6.10
- 5.6.9
- 5.6.8
- 5.6.7
- 5.6.6
- 5.6.5
- 5.5.30
- 5.5.29
- 5.5.28
- 5.5.27
- 5.5.16
- 5.4.45
- 5.4.44
- 5.4.43

**Release Candidate**
- 7.0.0RC8
- 7.0.0RC7
- 7.0.0RC6
- 7.0.0RC5
- 7.0.0RC4
- 7.0.0RC3
- 7.0.0RC2
- 7.0.0RC1
- 5.6.16RC1
- 5.6.15RC1
- 5.6.14RC1
- 5.6.13RC1

**Beta**

- 7.0.0beta3
- 7.0.0beta2
- 7.0.0beta1

**Alpha**

- 7.0.0alpha2
- 7.0.0alpha1


## Exposed Volumes
- `/usr/local/php/etc`

| Mount Point               | Description                                                                                         |
| ------------------------- |:---------------------------------------------------------------------------------------------------:|
| /usr/local/php/etc        | Is the main php config file path. PHP will look here for things like `ini` files and `php-fpm.conf` |


## Examples

### Get the PHP version

```
docker run --rm fntlnz/php:7.0.0RC1 php -v
PHP 7.0.0RC1 (cli) (built: Aug 22 2015 21:48:29) 
Copyright (c) 1997-2015 The PHP Group
Zend Engine v3.0.0-dev, Copyright (c) 1998-2015 Zend Technologies
```

### Create a derivative Dockerfile to add additional PHP extensions

**Create the Dockerfile**
```
FROM fntlnz/php:5.6.15
WORKDIR /tmp
RUN wget -nv -O - https://pecl.php.net/get/mongo-1.6.11.tgz | tar zx \
    && cd mongo-1.6.11 \
    && phpize \
    && ./configure \
    && make -j \
    && make install
WORKDIR /
```

**Build it**
```
docker build -t you/php:5.6.15
```

**Check if the Mongo PHP Driver is available**

The `-d extension=mongo.so` command line argument is a cli alternative
to adding extension loading in the `php.ini`
```
docker run --rm you/php:5.6.15 php -d extension=mongo.so -m | grep mongo
```

## Build

Build a specific version
```
./build.sh <version>
```

## Pro tip
![Old School PHP Logo](http://i.imgur.com/QN1UfxT.gif)

I added the [php.net logo](https://github.com/php/web-php/blob/master/images/logo.php#L54) as source for the logo on top of this README  so you can get random running ElePHPant or an old school one. :tada:
