FROM arian/docker-symbaloo-test-base

RUN apt-get update \
    && apt-get install -y iceweasel xvfb x11-xserver-utils \
    && apt-get -y autoclean

ENV FIREFOX_VERSION 39.0.3
RUN curl -o /tmp/firefox.tar.bz2 http://ftp.mozilla.org/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
    && tar xjf /tmp/firefox.tar.bz2 -C /usr/lib \
    && ln -s /usr/lib/firefox/firefox /usr/local/bin/firefox \
    && rm /tmp/firefox.tar.bz2

