echo $sDate 'Start of Logstash' >> $LOG_FILE
echo $sDate 'Kill of Logstash' >> $LOG_FILE
logstashpid=lsof -i:9600 | grep 'LISTEN' | awk '{print $2}'

if [ -z '$logstashpid' ]
then
echo $sDate '$logstashpid is empty' >> $LOG_FILE
else
echo $sDate '$logstashpid is NOT empty' >> $LOG_FILE
echo $sDate 'logstashpid :'$logstashpid >> $LOG_FILE
kill -9 $logstashpid
find <path to paths>/* -exec rm -rf {} \;
OSS=true /usr/share/logstash/bin/logstash -f '<path to logstash.conf>' --path.settings '<path to paths>' &
