# Google Chrome on Docker

```
docker run --rm --privileged \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v /dev/snd:/dev/snd \
-v $HOME/.config/google-chrome/:/google-chrome-data \
-e DISPLAY=$DISPLAY \
fntlnz/google-chrome
```
