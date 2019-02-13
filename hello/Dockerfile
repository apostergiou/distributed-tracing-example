FROM ruby:2.5.3

WORKDIR /hello
ADD hello/Gemfile /hello/Gemfile
ADD hello/Gemfile.lock /hello/Gemfile.lock
RUN bundle install --system

ADD . /hello
RUN bundle install --system
