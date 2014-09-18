# PHP Debug
Version: **5.6.0**

This Dockerfile compiles PHP with debug mode enabled, useful for PHP extension development.


## Usage

```
docker pull fntlnz/php-debug
```

Check the PHP version

```
docker run --rm  fntlnz/php-debug:5.6.0 php -v

Output:
PHP 5.6.0 (cli) (built: Sep 18 2014 09:31:22) (DEBUG)
Copyright (c) 1997-2014 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2014 Zend Technologies
```


Compile and test your extension

```
docker run -i -t -v ~/your-ext-path:/your-ext  fntlnz/php-debug:5.6.0 bash
cd /your-ext
phpize
./configure
make -j
make install
php -d extension=your-ext.so -r 'echo YourExt::staticMethod();'
```

## Volumes
- `/usr/local/php/etc`