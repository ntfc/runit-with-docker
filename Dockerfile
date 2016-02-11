FROM centos:7

RUN curl -s https://packagecloud.io/install/repositories/imeyer/runit/script.rpm.sh | bash && \
    yum install -y runit

# add https://github.com/pixers/runit-docker
COPY runit-docker/runit-docker.so /usr/lib64/

COPY runit_bootstrap /usr/sbin/

COPY service/test/ /etc/service/test/
COPY service/dep1/ /etc/service/dep1/

RUN chmod +x /usr/sbin/runit_bootstrap && \
    chmod +x /etc/service/test/{check,finish,run} && \
    chmod +x /etc/service/dep1/run

ENTRYPOINT [ "/usr/sbin/runit_bootstrap" ]
