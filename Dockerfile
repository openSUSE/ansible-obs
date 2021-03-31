FROM opensuse/tumbleweed

ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME=foo


RUN zypper -n install openssh-clients ansible ruby ruby-devel bash git libxml2-devel gcc make shadow vim curl
RUN zypper -q clean -a

RUN useradd -l -u ${USER_ID} -g users --home-dir /home/${USER_NAME} --create-home ${USER_NAME}

ADD "entrypoint.sh" /

ENTRYPOINT ["bash", "-c", "/entrypoint.sh"]
