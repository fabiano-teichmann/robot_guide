*** Variables ***


${collection}   test_collection    
&{people}    name=Fabiano Teichmann   email=fabiano.geek@gmail.com  age=37

*** Settings ***
Documentation  This test test service exchange equipament and not test microservice exchange
Library  ../libraries/Mongo/insert.py
Library  ../libraries/Mongo/query.py
Library  ../libraries/Mongo/drop_collection.py

Suite Setup  Clean database


***Test Cases ***
Scenary 01: Test lib mongo
    Given I insert document in database
    Then I have one document in database
    

*** Keyword ***
I insert document in database
    Insert One   ${collection}  ${people} 


I have one document in database
    Get One Document  ${collection}  ${people} 

Clean database
    Drop Collection  ${collection}  