# PHP-FPM
Version: **5.5.16**

This Dockerfile compiles PHP-FPM.

I have not pushed this on the docker registry because being compiled each installation may require different options/extensions.

For a complete example see the [nginx-fpm](https://github.com/fntlnz/dockerfiles/tree/master/fig-examples/nginx-fpm) fig example

## Volumes
- `/usr/local/php/etc`

## Build

**Optional**
1. Open the Dockerfile
2. Download packages you need
3. Add your extensions/options to the configure command

Issue a

`make build`
