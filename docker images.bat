E:
cd jmeter-docker\base
docker build -t base .
cd ..\master
docker build -t master .
cd ..\slave
docker build -t slave .
cd ..\grafana
docker build -t grafana .
cd ..
docker-compose up
docker-compose down