FROM registry.opensuse.org/obs/server/unstable/containers/containers/openbuildservice/ansible-obs-base:latest

ARG USER_ID=1000
ARG GROUP_ID=100
ARG USER_NAME=foo

RUN useradd -l -u ${USER_ID} -g ${GROUP_ID} --home-dir /home/${USER_NAME} --create-home ${USER_NAME}
ADD entrypoint.sh /

USER ${USER_NAME}

RUN ln -sf /home/${USER_NAME}/ansible-obs/tmp/bash_history /home/${USER_NAME}/.bash_history

ENTRYPOINT ["bash", "-c", "/entrypoint.sh"]

