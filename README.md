# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

### Build an Image

DEV
```
docker build -f Dockerfile.dev .
```

### Start A Development Cotaniner

Using traditional Command
```
docker run -it -p 3001:3001 -v /home/node/app/node_modules -v $(pwd):/home/node/app <image_id>
```
Using Docker-compose

```
docker-compose up
```

### Run Test

```
docker run -it <image_id> npm run test
```

### Run test LIVE
To enable hot reloading, we can attact command to the running container and check the Test status LIVE. The container which we are using should be started using one of the above start commands.

```
docker exec -it <container_id> npm run test
```


