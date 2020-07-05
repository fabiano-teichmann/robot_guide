
*** Settings ***
Documentation  This test is example how you get variables with robot framework
Resource  ../resource/ResourceEnvironmentVariables.robot

*** Test Cases ***

Scenary 01: Test get variable MongoDb
    Test Mongo Variable

Scenary 02: Test get variables RabbitMQ
    Test RabbitMQ Variables



*** Keywords ***

Test Mongo Variable
    should not be empty  ${MONGODB_URI}


Test RabbitMQ Variables
    should not be empty  ${RBMQ_HOST}
    should not be empty  ${RBMQ_USER}
    should not be empty  ${RBMQ_PASS}
    should not be empty  ${RBMQ_PORT}
