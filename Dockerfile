FROM maven:3.5

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl mysql-client nodejs xvfb rsync \
    && apt-get -y autoclean

RUN npm i -g xunit-viewer

RUN curl -o /usr/bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
    && chmod +x /usr/bin/wait-for-it.sh


ENV FIREFOX_VERSION 39.0.3
RUN wget --quiet http://ftp.mozilla.org/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
    && tar xjvf firefox-$FIREFOX_VERSION.tar.bz2 -C /usr/lib \
    && ln -s /usr/lib/firefox/firefox /usr/bin/firefox \
    && rm firefox-$FIREFOX_VERSION.tar.bz2
