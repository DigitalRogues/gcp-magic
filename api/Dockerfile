#multistage
FROM gliderlabs/alpine:3.3 as build-env

COPY api/Gemfile api/Gemfile.lock /usr/app/

ENV DEV curl-dev ruby-dev build-base
ENV RUNTIME tzdata libxml2 libxslt libevent libffi ruby ruby-io-console ruby-bundler
  
RUN apk add --no-cache $DEV  $RUNTIME && cd /usr/app && bundle install --deployment 


FROM gliderlabs/alpine:3.3
COPY --from=build-env /usr/app /usr/app
#set the timezone so calls to time.new are in PST
ENV TZ=America/Los_Angeles
ENV RUNTIME tzdata libxml2 libxslt libevent libffi ruby ruby-io-console ruby-bundler
RUN apk add --no-cache $RUNTIME && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY api/server.rb /usr/app
WORKDIR /usr/app
CMD ["bundle","exec","ruby","./server.rb"]
