FROM ruby:2.5.0
RUN apt-get update
RUN mkdir /rubycoin
WORKDIR /rubycoin
ADD Gemfile /rubycoin/Gemfile
ADD Gemfile.lock /rubycoin/Gemfile.lock
RUN bundle install
ADD . /rubycoin
