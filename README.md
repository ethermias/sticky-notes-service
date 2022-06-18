# sticky-notes-service

![The Sticky Notes](sticky-notes.jpg)

## Execute  

* Run `stack exec -- sticky-notes-service-exe` to see "We're inside the application!"
* With `stack exec -- sticky-notes-service-exe --verbose` you will see the same message, with more logging.

## Run tests

`stack test`


## API Documents

base api: localhost:8888

GET  /version
response : 
0.0.1


## WIth Docker

install docker and start docker on ur version

pull the latest version (current verion is 0.0.15) docker image from docker hub
```
docker pull ethermias/stack:0.0.15
```

run the image to start the service

```
docker run -d -p 8888:8888 ethermias/stack:0.0.15
```

The rest api will be ready (from more info the swagger page available by localhost:8888/swagger)

localhost:8888/swagger
localhost:8888/version
localhost:8888/contents
localhost:8888/contents/1
