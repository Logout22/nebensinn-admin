FROM debian:buster

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    iptables-persistent \
    openssh-server \
    python

RUN sed -i 's/#PermitRootLogin/PermitRootLogin/;s/#Port 22/Port 5365/' /etc/ssh/sshd_config \
 && mkdir -p /root/.ssh && mkdir -p /run/sshd \
 && chmod 700 /root/.ssh

ADD testmachine.pub /root/.ssh/authorized_keys

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
