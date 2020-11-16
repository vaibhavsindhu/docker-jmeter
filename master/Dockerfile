#This Dockerfile builds Apache JMeter Master Executable based on jmeterbase

#docker build -t vaibhavsindhu/master .

FROM vaibhavsindhu/base
LABEL Description="This image is used to start the Apache JMeter Master Executable"

# Set work directory to be /jmeter
WORKDIR /jmeter

# Copy contents of current directory to /jmeter
COPY . /jmeter


ARG JMETER_VERSION="5.3"

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin

#Port 60000 required for JMeter Master
EXPOSE 60000

# Make entrypoint.sh executable
RUN chmod +x ./entrypoint.sh

COPY entrypoint.sh /entrypoint.sh

# Execute entrypoint.sh
CMD sh /entrypoint.sh