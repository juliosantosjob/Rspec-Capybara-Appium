FROM ruby:3.2.2

WORKDIR /e2e

COPY Gemfile ./

RUN bundle install 

COPY . .

CMD ["rake", "run[regression]"]