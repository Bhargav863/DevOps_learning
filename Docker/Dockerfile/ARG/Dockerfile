ARG version=8
#FROM almalinux:${version}
# ARG variable before FROM cannot work after FROM.
#RUN "echo version passed by the user is : ${version}"

# docker build -t arg:v1 --build-arg version=9
# If user forgets to pass the value to the ARG there should always be a default value.
FROM almalinux:${version}
ARG COURSE
ARG LEARNER
RUN echo "${LEARNER} is learning ${COURSE}"

