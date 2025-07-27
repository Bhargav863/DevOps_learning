* The ARG instruction defines a variable that users can pass at build-time to the builder with the docker build command using the --build-arg <varname>=<value> flag.
* It will supply the variables at build time.
* For example you are using almalinux:7 as the base image and there is an update to the image. Instead of modifying in the Dockerfile directly, you can do it through ARG.
* It isn't recommended to use build arguments for passing secrets such as user credentials, API tokens, etc. Build arguments are visible in the docker history command.
* A Dockerfile may include one or more ARG instructions. 
* In every Dockerfile, we can see FROM as the first instruction and it should be the first instruction.
* There is only one exception, ARG can be first instruction to supply the argument to FROM instruction.
* ARG variable before FROM cannot work after FROM.
```
ARG version
FROM almalinux:${version}
```
* Command to pass the arguments.
```
docker build -t arg:v1 --build-arg version=8
```
* If user forgets to pass the value to the ARG there should always be a default value.
```
ARG version
FROM almalinux:${version:-8}
ARG COURSE
ARG LEARNER
echo "${LEARNER} is learning ${COURSE}"
```
```
docker build -t arg:v2 . --build-arg COURSE=Docker LEARNER=Bhargav
```