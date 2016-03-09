FROM ubuntu:14.04
MAINTAINER Mads Nielsen <man@praqma.net>

RUN apt-get update \
	&& apt-get install -y zlib1g-dev \
	&& apt-get -y install libssl-dev \
	&& apt-get -y install build-essential \
	&& apt-get install -y cmake \
	&& apt-get install -y wget \
	&& apt-get install -y openjdk-7-jdk \
	&& apt-get install -y git \
	&& apt-get install -y openssh-server \
	&& sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd \
	&& mkdir -p /var/run/sshd \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* 

RUN adduser --quiet jenkins \ 
	&& echo "jenkins:jenkins" | chpasswd

RUN mkdir /home/jenkins/setup
RUN mkdir /opt/static-analysis

COPY analyzer.rb /opt/static-analysis
COPY report_usage_analysis_template.html /opt/static-analysis
COPY report_duplication_analysis_template.html /opt/static-analysis

WORKDIR /home/jenkins/setup

RUN wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz \
	&& tar -xzf ruby-2.3.0.tar.gz \
	&& ./ruby-2.3.0/configure  \
	&& make install \
	&& gem install docopt \
	&& gem install github-pages -v 51

WORKDIR /home/jenkins 

RUN rm -rf /home/jenkins/setup

RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

	




 
