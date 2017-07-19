FROM ruby:2.4
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN apt-get update && apt-get install nodejs -y
VOLUME /usr/src/app
EXPOSE 3000
CMD ["irb"]
