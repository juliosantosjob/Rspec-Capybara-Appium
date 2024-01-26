FROM ruby:3.0

WORKDIR /tests

EXPOSE 4723

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

ENTRYPOINT  ["rake", "run[login]"]

# docker build -t ruby-automation .
# docker run ruby-automation .
# docker rmi -f ruby-automation