FROM ruby:2.7

WORKDIR /app

COPY frank.rb /app
COPY Gemfile /app
COPY config.ru /app
COPY lyrics.json /app

RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]