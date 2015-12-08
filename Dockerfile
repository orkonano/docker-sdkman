FROM tifayuki/java:7
MAINTAINER Mariano Kfuri <orquito@gmail.com>

ENTRYPOINT ["sdkman-exec.sh"]

# clean apt cache
RUN apt-get clean
RUN apt-get update
RUN apt-get install -y curl unzip

# install sdkman
RUN curl -s get.sdkman.io | bash

ADD sdkman.config /.sdkman/etc/config

ADD bin/ /usr/local/bin/

RUN /bin/bash -c "source .sdkman/bin/sdkman-init.sh"
