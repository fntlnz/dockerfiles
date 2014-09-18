# PHP Debug
Version: **5.5.16**

This Dockerfile compiles PHP with debug mode enabled, useful for PHP extension development.


## Usage

```
docker pull fntlnz/php-debug
```

Check the PHP version

```
docker run --rm  fntlnz/php-debug:5.5.16 php -v

Output:
PHP 5.5.16 (cli) (built: Aug 26 2014 22:50:14) (DEBUG)
Copyright (c) 1997-2014 The PHP Group
Zend Engine v2.5.0, Copyright (c) 1998-2014 Zend Technologies
```


Compile and test your extension

```
docker run -i -t -v ~/your-ext-path:/your-ext  fntlnz/php-debug:5.5.16 bash
cd /your-ext
phpize
./configure
make -j
make install
php -d extension=your-ext.so -r 'echo YourExt::staticMethod();'
```

## Volumes
- `/usr/local/php/etc`