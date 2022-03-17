FROM registry.opensuse.org/opensuse/leap:15.3

ARG USER_ID=1000
ARG GROUP_ID=100
ARG USER_NAME=foo

RUN zypper ar -f -G https://download.opensuse.org/repositories/devel:/languages:/ruby/openSUSE_Leap_15.3/devel:languages:ruby.repo
RUN zypper --gpg-auto-import-keys refresh

RUN zypper -n install openssh-clients ansible ruby3.1-devel bash git libxml2-devel gcc make shadow vim curl libxslt-devel
RUN zypper -q clean -a

RUN useradd -l -u ${USER_ID} -g ${GROUP_ID} --home-dir /home/${USER_NAME} --create-home ${USER_NAME}

# Ensure there is bundle command without ruby suffix
RUN for i in ruby gem irb bundle bundler; do ln -s /usr/bin/$i.ruby3.1 /usr/local/bin/$i; done

WORKDIR /home/${USER_NAME}/ansible-obs
ADD Gemfile /home/${USER_NAME}/ansible-obs
ADD Gemfile.lock /home/${USER_NAME}/ansible-obs
RUN bundle.ruby3.1 config build.nokogiri --use-system-libraries && bundle.ruby3.1 install
ADD "entrypoint.sh" /

ENTRYPOINT ["bash", "-c", "/entrypoint.sh"]
