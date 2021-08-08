FROM ubuntu:21.04

# make dpkg noninteractive
ENV DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

COPY ./docker/install-sshserver.sh /tmp/
RUN /tmp/install-sshserver.sh

COPY ./docker/define-system-language.sh /tmp/
RUN /tmp/define-system-language.sh en_US.UTF-8

COPY ./docker/install-basics.sh /tmp/
RUN /tmp/install-basics.sh

COPY ./docker/install-docker.sh /tmp/
RUN /tmp/install-docker.sh

COPY ./docker/prepare-x11forwarding.sh /tmp/
RUN /tmp/prepare-x11forwarding.sh

COPY ./docker/install-dev-tools.sh /tmp/
RUN /tmp/install-dev-tools.sh

COPY ./docker/install-gcc.sh /tmp/
RUN /tmp/install-gcc.sh 11

COPY ./docker/install-cmake.sh /tmp/
RUN /tmp/install-cmake.sh 3.21 1

COPY ./docker/install-clion.sh /tmp/
RUN /tmp/install-clion.sh 2021.2

COPY ./docker/install-ansible.sh /tmp/
RUN /tmp/install-ansible.sh

# create user
ARG user=dev
COPY ./docker/prepare-user.sh /tmp/
RUN /tmp/prepare-user.sh ${user}

USER ${user}
COPY ./ansible /tmp/ansible
RUN /tmp/ansible/docker-provision.sh
USER root

# run SSH server
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
