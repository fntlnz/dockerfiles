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
todo
todo
todo
todo
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