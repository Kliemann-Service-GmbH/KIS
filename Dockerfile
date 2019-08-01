# Dockerfile
FROM ruby:2.6

MAINTAINER Stefan Müller <co@zzeroo.com>

ARG USER_ID
ARG GROUP_ID

# Setup the base OS
RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    apt-transport-https \
    apt-utils \
    build-essential  \
    ca-certificates \
    curl \
    gnupg2 \
    locales \
    postgresql-client \
    && true

# Use en_US.UTF-8 as our locale
RUN locale-gen de_DE.UTF-8
ENV LANG de_DE.UTF-8
ENV LANGUAGE de_DE:de
ENV LC_ALL de_DE.UTF-8

# Map the current user `id` and group to the docker intern user `docker-user`.
# This docker user has then the same id / gid as your user.
RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
    groupadd -g ${GROUP_ID} docker-user &&\
    useradd -l -u ${USER_ID} -g docker-user docker-user &&\
    install -d -m 0755 -o docker-user -g docker-user /home/docker-user \
;fi

# install node from nodesource
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y yarn \
  && rm -rf /var/lib/apt/lists/*

# all rails files are under the path /app
ENV app /app
RUN install -d -m 0755 -o docker-user -g docker-user  $app
RUN install -d -m 0755 -o docker-user -g docker-user  /box

WORKDIR $app

# Move BUNDLE_PATH
# see: https://medium.com/magnetis-backstage/how-to-cache-bundle-install-with-docker-7bed453a5800
ENV BUNDLE_PATH /box
# install bundler and gems from repo
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5


# copy the main application to /app
COPY . $app

RUN chown ${USER_ID}:${GROUP_ID} -R $app

USER ${USER_ID}

# expose port 3000 so we can access it from outside of docker
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
