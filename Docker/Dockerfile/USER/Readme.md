# USER instruction sets the user name (or UID) and optionally the user group (or GID) to use as the default user and group for the remainder of the current stage.
# The specified user is used for RUN instructions and at runtime, runs the relevant ENTRYPOINT and CMD commands.
# We have many docker containers belongs to many projects. Ultimately the docker uses the storage of the VM only
# If you give root access to the container then the container will get the entire server access. It may have the chance to manipulate other containers.
