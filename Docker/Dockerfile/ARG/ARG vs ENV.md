ARG variables only work during the image build time. But ENV variables will work during build time and during runtime as well.

```
FROM almalinux:8
ARG Course
ARG Learner
ENV Concept=${Course}
ENV Trainer=${Learner}
RUN echo "Course is ${Concept} and Learner is ${Trainer}"
```
```
docker build -t arg:v3 --build-arg Course=Docker --build-arg Learner=Bhargav .
```
```
docker run -d arg:v3 sleep 100
```
* To see environment variables.
```
docker exec -it <container_id> env
```