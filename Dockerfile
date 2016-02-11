FROM centos:7

RUN curl -s https://packagecloud.io/install/repositories/imeyer/runit/script.rpm.sh | bash && \
    yum install -y runit

# add https://github.com/pixers/runit-docker
COPY runit-docker/runit-docker.so /usr/lib64/

COPY runit_bootstrap /usr/sbin/

COPY service/ /etc/service/

RUN chmod +x /usr/sbin/runit_bootstrap && \
    chmod +x /etc/service/test/{check,finish,run} && \
    chmod +x /etc/service/dep1/{check,finish,run} && \
    chmod +x /etc/service/dep2/{check,finish,run}

ENTRYPOINT [ "/usr/sbin/runit_bootstrap" ]
