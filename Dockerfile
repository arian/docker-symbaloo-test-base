FROM maven:3.5

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl mysql-client nodejs xvfb rsync tomcat7 \
    && apt-get -y autoclean

RUN npm i -g xunit-viewer

RUN curl -o /usr/bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
    && chmod +x /usr/bin/wait-for-it.sh


ENV FIREFOX_VERSION 39.0.3
RUN curl -o /tmp/firefox.tar.bz2 http://ftp.mozilla.org/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
    && tar xjvf /tmp/firefox.tar.bz2 -C /usr/lib \
    && ln -s /usr/lib/firefox/firefox /usr/bin/firefox \
    && rm /tmp/firefox.tar.bz2

ENV PATH=$PATH:/usr/share/tomcat7/bin
ENV CATALINA_BASE=/var/lib/tomcat7
ENV CATALINA_HOME=/usr/share/tomcat7
