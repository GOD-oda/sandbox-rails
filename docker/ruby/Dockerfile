FROM ruby:3.2.2

RUN apt-get update -qq  \
    && apt-get install -y build-essential libpq-dev

RUN mkdir /src
WORKDIR /src

ADD src/Gemfile /src/Gemfile
ADD src/Gemfile.lock /src/Gemfile.lock
RUN gem uninstall bundler
RUN gem install bundler -v 2.4.13

RUN bundle install

ADD . /src
