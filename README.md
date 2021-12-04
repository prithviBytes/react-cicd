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

Alertnatively we can create a seperate service in docker-compose file and then run test while having the volumes mapped correctly from the local.
The drawback with this approach is that it remove the interactivity with the tests.

### Using Travis CI

Activating Build In Travis CI is essential.
Repository should have a **.tavis.ci** file.
This file will then Indicate the execution steps.
All the tests would be executed and if there are any errors Travis CI would indicate that the test has failed, or passed.

