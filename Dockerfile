FROM centos:centos6

RUN yum -y update
RUN yum -y install openssh-server openssh-clients
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && sed -ri "s/^#PermitRootLogin yes/PermitRootLogin yes/" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && echo "root:root" | chpasswd
ADD .ssh/id_rsa.pub /root/.ssh/authorized_keys
RUN chmod -R 600 /root/.ssh
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
