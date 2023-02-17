FROM ruby:3.2.1-alpine
LABEL maintainer="san.storres@gmail.com"

ENV APP_HOME=/usr/src/app
ENV RUBY_VERSION=3.2.1

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

RUN gem update --system
RUN gem install bundler
RUN bundle install

CMD rspec #APP_HOME/spec
