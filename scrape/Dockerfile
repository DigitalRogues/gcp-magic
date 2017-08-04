#multistage
FROM gliderlabs/alpine:3.3 as build-env

COPY scrape/Gemfile scrape/Gemfile.lock /usr/app/

ENV DEV build-base ruby-dev libxml2-dev libxslt-dev
ENV RUNTIME tzdata libxml2 libxslt  ruby ruby-io-console ruby-bundler

RUN apk add --no-cache $DEV $RUNTIME && cd /usr/app && bundle config build.nokogiri --use-system-libraries && bundle install --deployment 


FROM gliderlabs/alpine:3.3
COPY --from=build-env /usr/app /usr/app
#set the timezone so calls to time.new are in PST
ENV TZ=America/Los_Angeles
ENV RUNTIME tzdata libxml2 libxslt  ruby ruby-io-console ruby-bundler
RUN apk add --no-cache $RUNTIME && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#stick this last since its the most likely to change, everythign above gets cached
COPY scrape/scrape.rb /usr/app
WORKDIR /usr/app
CMD ["bundle","exec","ruby","./scrape.rb"]


#streamlined the crap outta this yo.