# docker-youtubedl [![CircleCI](https://circleci.com/gh/jaumepb/docker-youtubedl.svg?style=svg)](https://circleci.com/gh/jaumepb/docker-youtubedl)

## Download single entry
```
youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0 YT_URL
```

## Download playlist
```
youtube-dl -ic --yes-playlist --extract-audio --audio-format mp3 -o "%(title)s-%(id)s.%(ext)s" --audio-quality 0 https://www.youtube.com/playlist?list=UUCvVpbYRgYjMN7mG7qQN0Pg
```

## Download playlist, --download-archive downloaded.txt add successfully downloaded files into downloaded.txt
```
youtube-dl --download-archive downloaded.txt --no-overwrites -ic --yes-playlist --extract-audio --audio-format mp3 -o "%(title)s-%(id)s.%(ext)s" --audio-quality 0 --socket-timeout 5 https://www.youtube.com/playlist?list=UUCvVpbYRgYjMN7mG7qQN0Pg
```

## Retry until success, no -i option
```
while ! youtube-dl --download-archive downloaded.txt --no-overwrites -c --yes-playlist --extract-audio --audio-format mp3 -o "%(title)s-%(id)s.%(ext)s" --audio-quality 0 --socket-timeout 5 <YT_PlayList_URL>; do echo DISCONNECTED; sleep 5; done
```

## Execute docker
```
docker run -ti --rm -v $(pwd):/downloads/ jaume/youtubedl -ic --yes-playlist --extract-audio --audio-format mp3 -o "%(title)s-%(id)s.%(ext)s" --audio-quality 0 "https://www.youtube.com/watch?v=61_qsDeuFu8&list=RDEMXxfK_00a7UpcbvS8-vziIA"
```

## Alias
```
alias dyoutubedlmp3=`docker pull jaume/youtubedl:latest; docker run -it --rm --user $UID:$GID -v ${PWD}:/downloads jaume/youtubedl:latest  -ic -o "%(title)s-%(id)s.%(ext)s" --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 `
```

