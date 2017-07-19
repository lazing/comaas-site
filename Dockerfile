FROM ruby
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/ && gem install rails
RUN mkdir /app
WORKDIR /app
VOLUME /app
EXPOSE 3000
