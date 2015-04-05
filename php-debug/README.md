# PHP Debug
Latest Tagged Version: **5.6.6**

This Dockerfile compiles PHP with debug mode enabled, useful for PHP extension development.

Available Versions
- master
- 5.6.6
- 5.6.1
- 5.6.0
- 5.5.16

## Usage

```
docker pull fntlnz/php-debug
```

### Check the PHP version

```
docker run --rm  fntlnz/php-debug:master php -v

Output:
PHP 7.0.0-dev (cli) (built: Apr  5 2015 22:10:55) (DEBUG)
Copyright (c) 1997-2015 The PHP Group
Zend Engine v3.0.0-dev, Copyright (c) 1998-2015 Zend Technologies
```


### Compile and test your extension

```
docker run -i -t -v ~/your-ext-path:/your-ext  fntlnz/php-debug:master bash
cd /your-ext
phpize
./configure
make -j
make install
php -d extension=your-ext.so -r 'echo YourExt::staticMethod();'
```

## Volumes
- `/usr/local/php/etc`
