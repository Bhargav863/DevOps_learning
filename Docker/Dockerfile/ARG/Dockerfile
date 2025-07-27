ARG version
#FROM almalinux:${version}
# ARG variable before FROM cannot work after FROM.
#RUN "echo version passed by the user is : ${version}"

# docker build -t arg:v1 --build-arg version=9
# If user forgets to pass the value to the ARG there should always be a default value.
FROM almalinux:${version:-8}
ARG COURSE
ARG LEARNER
echo "${LEARNER} is learning ${COURSE}"

