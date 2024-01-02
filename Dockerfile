FROM ruby:latest
RUN apt-get update
RUN apt-get install -y build-essential
WORKDIR /client_app
COPY Gemfile /client_app/
RUN bundle install
EXPOSE 3006
CMD rm -f /client_app/tmp/pids/server.pid && bundle exec rails s -p 3006 -b '0.0.0.0'
