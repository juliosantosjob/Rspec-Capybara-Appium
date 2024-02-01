FROM ruby:3.2.2

WORKDIR /e2e

COPY Gemfile ./

RUN bundle install 

COPY . .

CMD ["rake", "run[login]"]

# docker build -t ruby-automation .
# docker run ruby-automation
# docker rmi -f ruby-automation
# docker images
# EXPOSE 4723