FROM ruby:2.3.4-alpine
LABEL authors="Mads Nielsen <man@praqma.net>, Michael Madsen <mim@praqma.net>"

RUN mkdir -p /opt/static-analysis

COPY analyzer.rb /opt/static-analysis
COPY report_usage_analysis_junit_template.xml /opt/static-analysis
COPY report_duplication_junit_template.xml /opt/static-analysis

RUN apk add --no-cache --virtual .build_deps \
    ruby-dev build-base &&\
    gem install docopt &&\
    gem install github-pages -v 134 &&\
    apk del .build_deps

EXPOSE 4000

#WORKDIR /home/jenkins 

#RUN apt-get install -y locales
#RUN locale-gen en_US.UTF-8  
#ENV LANG en_US.UTF-8  
#ENV LANGUAGE en_US.UTF-8 
#ENV LC_ALL en_US.UTF-8  

