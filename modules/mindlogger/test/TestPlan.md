** How to execute tests using Docker **

For execute tests using Docker please run command _docker-compose run -e DOCKER_WEB_SERVER=http://host.docker.internal:$WEB_SERVER_PORT$ -T --rm unit-tests vendor/bin/phpunit --configuration test/phpunit.xml ./modules/mindlogger/test/Schema_Test.php_
where $WEB_SERVER_PORT$ should be changed to your actual web server port. 
