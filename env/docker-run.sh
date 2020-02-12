# mysql
docker run --name mysql -d -v /data/mysql:/var/lib/mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql:5.7
# rabbitmq
docker run --name rabbitmq -d rabbitmq:latest

# phantomjs
# docker run --name phantomjs -d binux/pyspider:latest phantomjs

# result worker
# docker run --name result_worker -m 128m -d --link mysql:mysql --link rabbitmq:rabbitmq binux/pyspider:latest result_worker
# processor, run multiple instance if needed.
# docker run --name processor -m 256m -d --link mysql:mysql --link rabbitmq:rabbitmq binux/pyspider:latest processor
# fetcher, run multiple instance if needed.
# docker run --name fetcher -m 256m -d --link phantomjs:phantomjs --link rabbitmq:rabbitmq binux/pyspider:latest fetcher --no-xmlrpc
# scheduler
# docker run --name scheduler -d --link mysql:mysql --link rabbitmq:rabbitmq binux/pyspider:latest scheduler
# webui
# docker run --name webui -m 256m -d -p 5000:5000 --link mysql:mysql --link rabbitmq:rabbitmq --link scheduler:scheduler --link phantomjs:phantomjs binux/pyspider:latest webui
