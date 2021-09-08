FROM registry.opensuse.org/opensuse/leap:15.3

ARG USER_ID=1000
ARG GROUP_ID=100
ARG USER_NAME=foo

RUN zypper -n install openssh-clients ansible ruby ruby-devel bash git libxml2-devel gcc make shadow vim curl
RUN zypper -q clean -a

RUN useradd -l -u ${USER_ID} -g ${GROUP_ID} --home-dir /home/${USER_NAME} --create-home ${USER_NAME}

RUN gem install bundler -v '~> 2.2'

# Ensure there is bundle command without ruby suffix
RUN for i in bundle bundler; do ln -s /usr/bin/$i.ruby2.5 /usr/local/bin/$i; done

WORKDIR /home/${USER_NAME}/ansible-obs
ADD Gemfile /home/${USER_NAME}/ansible-obs
ADD Gemfile.lock /home/${USER_NAME}/ansible-obs
RUN bundle install

ADD "entrypoint.sh" /

ENTRYPOINT ["bash", "-c", "/entrypoint.sh"]
