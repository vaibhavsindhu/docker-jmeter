#This Dockerfile builds Apache JMeter slave Executable based on a jmeterbase

#docker build -t vaibhavsindhu/slave .

FROM vaibhavsindhu/base
LABEL Description="This image is used to start the Apache JMeter Server/slave Executable"

ARG JMETER_VERSION="5.3"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN  ${JMETER_HOME}/bin

# Ports required for JMeter Slaves/Server
EXPOSE 1099 50000

#copy jks to bin
#COPY jks /${JMETER_BIN}

#RUN sed -i 's/#server.rmi.ssl.disable=false/server.rmi.ssl.disable=true/g' ${JMETER_BIN}/jmeter.properties
#RUN sed -i 's/#server.rmi.ssl.keystore.file=rmi_keystore.jks/server.rmi.ssl.keystore.file=rmi_keystore.jks/g' #${JMETER_BIN}/jmeter.properties

# Application to be executed to start the JMeter container
ENTRYPOINT ${JMETER_BIN}/jmeter-server \
                      -Dserver.rmi.localport=50000 \
                    -Dserver_port=1099
