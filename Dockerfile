FROM ruby:3.0.0

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git vim

#RUN touch Gemfile
#RUN echo "source 'https://rubygems.org'" > Gemfile
#RUN echo "gem 'rails', '6.1.3.1'" >> Gemfile
#RUN echo "gem 'sidekiq'" >> Gemfile
RUN { \
  echo "source 'https://rubygems.org'"; \
  echo "gem 'rails', '6.1.3.1'"; \
  echo "gem 'sidekiq'"; \
} > Gemfile

#RUN bundle config --local bin 'vendor/bin'
#RUN bundle config --local path 'vendor/bundle'
RUN bundle install
RUN rails new . -d postgresql --api --minimal
