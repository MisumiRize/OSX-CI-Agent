FROM centos:centos6

RUN yum -y install openssh-server openssh-clients
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && ssh-keygen -q -N "" -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
ADD .ssh/id_rsa.pub /root/.ssh/authorized_keys
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
