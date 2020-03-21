FROM qianchun27/centos-jdk-maven:7.8.3

MAINTAINER qianchun, qianchun27@hotmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV BASE_INSTALL_DIR /opt/install

RUN mkdir -p ${BASE_INSTALL_DIR}

COPY install.sh ${BASE_INSTALL_DIR}

# install nginx
COPY nginx/nginx.sh ${BASE_INSTALL_DIR}
COPY nginx/user.sh ${BASE_INSTALL_DIR}
COPY nginx/restart.sh ${BASE_INSTALL_DIR}
COPY nginx/nginx.conf ${BASE_INSTALL_DIR}
COPY nginx/server_admin.souyidai.com.conf ${BASE_INSTALL_DIR}
COPY nginx/upstream_jenkins.conf ${BASE_INSTALL_DIR}
COPY nginx/upstream_nexus.conf ${BASE_INSTALL_DIR}
COPY nginx-1.13.12-1.el7_4.ngx.x86_64.rpm  ${BASE_INSTALL_DIR}

# install nexus
COPY nexus/nexus.sh ${BASE_INSTALL_DIR}
COPY nexus/restart.sh ${BASE_INSTALL_DIR}
COPY nexus/nexus.properties ${BASE_INSTALL_DIR}
COPY nexus-3.2.0-01-unix.tar.gz ${BASE_INSTALL_DIR}

# install jenkins
COPY jenkins/jenkins.sh ${BASE_INSTALL_DIR}
COPY jenkins-2.189-1.1.noarch.rpm ${BASE_INSTALL_DIR}

RUN sh ${BASE_INSTALL_DIR}/install.sh
