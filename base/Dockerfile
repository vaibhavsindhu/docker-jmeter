#This Dockerfile builds Apache JMeter Base Executable
#docker build -t vaibhavsindhu/base .

FROM alpine

LABEL Description="This image is used to prepare the Apache JMeter base Executable"

# Set work directory to be /jmeter
#WORKDIR /jmeter

# Copy contents of current directory to /jmeter
#COPY . /jmeter


# Install openjre (required in order to run jmeter) 
RUN apk add --no-cache \
	openjdk8-jre

ARG JMETER_VERSION="5.3"

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin
ENV MIRROR_HOST http://mirrors.ocf.berkeley.edu/apache/jmeter
ENV JMETER_DOWNLOAD_URL ${MIRROR_HOST}/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ENV JMETER_PLUGINS_DOWNLOAD_URL https://repo1.maven.org/maven2/kg/apc
ENV JMETER_PLUGINS_FOLDER ${JMETER_HOME}/lib/ext/

#Time Zone https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
ENV TIMEZONE Asia/Kolkata

RUN    apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
            && apk add --update openjdk8-jre tzdata curl unzip bash \
            && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
            && echo ${TIMEZONE} >  /etc/timezone \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies  \
	&& curl -L ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /opt  \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
	&& rm -rf /tmp/dependencies \
	&& curl -L ${JMETER_PLUGINS_DOWNLOAD_URL}/cmdrunner/2.2/cmdrunner-2.2.jar -o ${JMETER_HOME}/lib/cmdrunner-2.2.jar \
	&& curl -L ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-manager/1.4/jmeter-plugins-manager-1.4.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-manager-1.4.jar \
	&& curl -L ${JMETER_PLUGINS_DOWNLOAD_URL}/jmeter-plugins-json/2.7/jmeter-plugins-json-2.7.jar -o ${JMETER_PLUGINS_FOLDER}/jmeter-plugins-json-2.7.jar


#copy jks to bin
COPY jks /${JMETER_BIN}

#ENV PATH $PATH:$JMETER_BIN
#ENV testDir /jmeter/test

#RUN sed -i "s|user.properties=user.properties|user.properties=${testDir}/user.properties|g; \
#	    s|#javascript.use_rhino=false|javascript.use_rhino=true|g" ${JMETER_BIN}/jmeter.properties

#Set rmi ssl disable as true in jmeter.properties file 
RUN sed -i 's/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/g' ${JMETER_BIN}/jmeter.properties
RUN sed -i 's/#server.rmi.ssl.keystore.file=rmi_keystore.jks/server.rmi.ssl.keystore.file=rmi_keystore.jks/g' ${JMETER_BIN}/jmeter.properties