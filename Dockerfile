FROM orconano/docker-java:latest

MAINTAINER Mariano Kfuri <orquito@gmail.com>

ENTRYPOINT ["sdkman-exec.sh"]

RUN apt-get update && apt-get install -y curl \
    unzip \
    && apt-get clean 

# install sdkman
RUN curl -s get.sdkman.io | bash

COPY sdkman.config /.sdkman/etc/config

COPY bin/ /usr/local/bin/

RUN /bin/bash -c "chmod +x /usr/local/bin/sdkman-exec.sh && chmod +x /usr/local/bin/sdkman-wrapper.sh && chmod +x //root/.sdkman/bin/sdkman-init.sh"

RUN /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh"
