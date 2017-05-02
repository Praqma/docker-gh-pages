FROM ruby:2.3.4-alpine
LABEL authors="Mads Nielsen <man@praqma.net>, Michael Madsen <mim@praqma.net>"

RUN apk add --no-cache --virtual .build_deps \
    ruby-dev build-base &&\
    gem install docopt &&\
    gem install github-pages -v 134 &&\
    apk del .build_deps

RUN mkdir -p /opt/static-analysis

COPY analyzer.rb /opt/static-analysis
COPY report_usage_analysis_junit_template.xml /opt/static-analysis
COPY report_duplication_junit_template.xml /opt/static-analysis

RUN chmod +x /opt/static-analysis/analyzer.rb
RUN ln -s /opt/static-analysis/analyzer.rb /usr/bin/analyzer 

EXPOSE 4000

