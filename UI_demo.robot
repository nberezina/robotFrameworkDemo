*** Settings ***
Documentation    A demo suite
Library  Selenium2Library
Resource  Keywords/UI_keywords.robot
Suite Setup  open portal  https://www.copaair.com/en/web/us

*** Test Cases ***
Demo UI test
    [Tags]    Demo
    log  "all done"  console=yes
    select depatrure country   region_id_Brazil   BR02
    sleep  2
    select destrination country  region_id_Mexico  MX00
    select departure date  3182018
    select return date  3092018
    submit search form




