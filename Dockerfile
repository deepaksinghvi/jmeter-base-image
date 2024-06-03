FROM openjdk:11

MAINTAINER deepak.singhvi@gmail.com

ARG JMETER_VERSION="5.6.3"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin

COPY apache-jmeter-${JMETER_VERSION}.tgz /opt/apache-jmeter-${JMETER_VERSION}.tgz
RUN tar -xvf /opt/apache-jmeter-${JMETER_VERSION}.tgz -C /opt/
RUN chmod -R 777 /opt/apache-jmeter-${JMETER_VERSION}/lib
RUN find /opt/apache-jmeter-${JMETER_VERSION}/lib -name "*.jar" -exec chmod 666 {} \;

ENV PATH $PATH:${JMETER_BIN}

RUN mkdir /app 
ADD . /app

WORKDIR	/app


RUN chmod 777 /app/entrypoint.sh

CMD /app/entrypoint.sh