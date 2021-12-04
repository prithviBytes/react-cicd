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


### AWS Elastic BeanStalk

Elastic Beanstalk is the easiest way to deploy a container.

We can create an environment and select Docker as a product.

AWS will route the request that comes to the <domain> to the <Load Balancer> that is by default created for us.

This LB will then route the request to the VM which has Docker running to the container that we have created which has our App running inside it.

The LB monitors the number of request coming to it and whenever the request reaches a threshol it will
increase the number of VM instaces to manage the load.

This new AWS platform will conflict with the project we have built since it will look for a docker.compose.yml file to build from by default instead of a Dockerfile.

Rename the docker-compose.yml file to docker-compose-dev.yml. Going forward you will need to pass a flag to specify which compose file you want to build and run from:

```
docker-compose -f docker-compose-dev.yml up
docker-compose -f docker-compose-dev.yml up --build
docker-compose -f docker-compose-dev.yml down
```


### API Keys

To deploy code to AWS we would require API keys, this can be achieved by Creating a User and granting the user with the essential permissions. Ideally we should be saving this KEY/SECRET to Travis CI Environment Variables.

### Expose PORT

In Dockerfile we would be specifying the port that we want to expose witht the keyword EXPOSE.
ElasticBeanstalk would look at this and Automatically map the port.