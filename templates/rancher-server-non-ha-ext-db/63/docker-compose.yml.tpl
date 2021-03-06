version: 2
services:
    db:
        image: mysql:5.5.53
        environment:
            MYSQL_DATABASE: ${MYSQL_DATABASE}
            MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
            MYSQL_USER: ${MYSQL_USER}
            MYSQL_PASSWORD: ${MYSQL_PASSWORD}
        command:
            - --max_allowed_packet=16M
    rancher:
        image: rancher/server:v1.6.5-rc1
        ports:
            - ${RANCHER_SERVER_PORT}:8080/tcp
        environment:
            CATTLE_DB_CATTLE_DATABASE: mysql
            CATTLE_DB_CATTLE_USERNAME: ${MYSQL_USER}
            CATTLE_DB_CATTLE_PASSWORD: ${MYSQL_PASSWORD}
            CATTLE_DB_CATTLE_MYSQL_HOST: db
            CATTLE_DB_CATTLE_MYSQL_PORT: 3306
            CATTLE_DB_CATTLE_MYSQL_NAME: ${MYSQL_DATABASE}
