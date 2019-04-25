FROM maven:3.6-jdk-11

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl nodejs rsync \
        mysql-client \
    && apt-get -y autoclean

RUN curl -o /usr/bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh \
    && chmod +x /usr/bin/wait-for-it.sh
