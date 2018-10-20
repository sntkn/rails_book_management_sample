FROM ruby:2.5.0

ENV APP /usr/src/app
WORKDIR $APP

COPY Gemfile* $APP/

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim postgresql-client

RUN bundle install -j4 --path vendor/bundle

ADD . $APP

CMD ["rails", "server", "-b", "0.0.0.0"]