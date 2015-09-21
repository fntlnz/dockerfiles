# Google Chrome on Docker

## On Linux

```
docker run --rm --privileged -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /dev/snd:/dev/snd $HOME/.config/google-chrome/:/google-chrome-data -e DISPLAY=$DISPLAY fntlnz/google-chrome
```

## On OS X

Substitute `192.168.189.1` with the ip address of your host from inside the vm.
You can figure it out with `arp -a`

```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
docker run --rm --privileged -e DISPLAY=192.168.189.1:0  fntlnz/google-chrome
```
