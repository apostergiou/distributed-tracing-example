FROM ruby:2.5.3

WORKDIR /hello_world
ADD hello_world/Gemfile /hello_world/Gemfile
ADD hello_world/Gemfile.lock /hello_world/Gemfile.lock
RUN bundle install --system

ADD . /hello_world
RUN bundle install --system
