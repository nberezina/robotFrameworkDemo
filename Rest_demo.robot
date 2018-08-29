*** Settings ***
Documentation    Suite description
Library  RequestsLibrary
Library  ./Lib/RestLib.py

*** Test Cases ***
Simple REST API test
    [Documentation]  This will create a session to https://jsonplaceholder.typicode.com and execure a request /todos/1
    [Tags]    Demo
    ${connection} =  create connection  https://jsonplaceholder.typicode.com
    ${header} =  create default header
    ${resp} =  send get request  connection=${connection}  uri=/todos/1  header=${header}  exp_status_code=200
    check json property  ${resp}  userId  1
    check json property  ${resp}  id  1
    check json property  ${resp}  completed  False


