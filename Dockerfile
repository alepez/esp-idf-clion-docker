FROM alepez/esp-idf:4.3-beta3

USER root
RUN apt-get update -qqy && \
    apt-get install -qqy \
      rsync \
      ssh \
      vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN echo /tmp/stderr{,.pub} | xargs -n 1 ln -sf /dev/stderr && yes | ssh-keygen -t ecdsa -b 521 -N '' -qf /tmp/stderr > /dev/null
RUN service ssh start && service ssh stop

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D", "-o", "ListenAddress=0.0.0.0" ]
