# PHP
Version: **5.5.15**

This Dockerfile compiles PHP with debug mode enabled, useful for PHP extension development.


## Usage
```bash
docker pull fntlnz/php-debugls
```

Check the PHP version
```bash
docker run --rm  fntlnz/php-debug php -v

Output:
PHP 5.5.15 (cli) (built: Aug 10 2014 13:10:06) (DEBUG)
Copyright (c) 1997-2014 The PHP Group
Zend Engine v2.5.0, Copyright (c) 1998-2014 Zend Technologies
```


Compile and test your extension
```bash
docker run -i -t -v ~/your-ext-path:/your-ext  fntlnz/php-debug bash
cd /your-ext
phpize
./configure
make -j
make install
php -d extension=your-ext.so -r 'echo YourExt::staticMethod();'
```

## Volumes
- `/usr/local/php/etc`