FROM ruby:2.3.1

ADD Gemfile* /sidekiq/
WORKDIR /sidekiq
RUN bundle install

ADD config.ru /sidekiq/

ENV RACK_ENV production

ENTRYPOINT []
CMD rackup config.ru -o 0.0.0.0 -p 3000
