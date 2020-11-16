#!/bin/bash

export PATH=$PATH:${JMETER_BIN}
#jmeter -n -t test/attempt1.jmx
jmeter -n -t /Scripts/${JMETER_TEST} -l /jmeter/Results/result-$(date +'%m_%d_%Y-%H_%M_%S_%N').jtl -j /jmeter/Logs/master-log-$(date +'%m_%d_%Y-%H_%M_%S_%N').log -e -o /jmeter/Results/MT_Report-$(date +'%m_%d_%Y-%H_%M_%S_%N')


#set command to execute
#CMD ["-n -t /jmeter/test/MidTier_updated.jmx -l /jmeter/results/reslut-$(date +'%m_%d_%Y-%H_%M_%S_%N').jtl -j /jmeter/logs/master-log-$( 
#date #+'%m_%d_%Y-%H_%M_%S_%N').log"]
