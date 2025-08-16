## Best practices of docker
* Use official docker images.
* Keep the image size as low as possible. Multistage build is the way of reducing the image size.
* Use Multi-stage builds.
* Optimize layers by club multiple instructions into one. For example Combine RUN commands using && and `\` to reduce the number of layers and improve build cache utilization.
* Keep frequently changing instruction at the end of docker file.
* Don't run the containers with root access.
* keep the env, secrets separate from the code.
* persist the logs
* Maintain own network instead of default network.
* Make use of docker volumes to persist the data.

## Disadvantages of docker.
* Lack of orchestration --> Can't manage containers working together.
* Manual scaling and deployment during the peak traffic times.
* Containers are ephermal in nature, if the container is exited we need to restart it manually. Docker doesn't have self healing nature. Application is down until you restarts the container.
* Containers are deployed on single host.If 10 containers are deployed on single host, one of the containers are using the more resources and it's affecting the other containers, which results in killing of containers.
* Docker doesn't support autoscaling or loadbalancing.
* Docker doesn't provide the enterprise support.
 
