**** Settings ***
Library     RequestsLibrary
Library     Collections
Library     String
Resource    API_login.robot

*** Variables ***
${url}      https://jsonplaceholder.typicode.com
${app}      /posts
${urlapp}   ${url}${app}

*** Test Cases ***
POST request
    API test    test    test    5   201

*** Keywords ***
API test
    [Arguments]     ${title}     ${body}    ${userid}   ${response_status}
    ${json} =   Catenate    {"title":"${title}", "body":"${body}", "userId":"${userid}"}
    ${json_utf8} =   Encode String To Bytes     ${json}    UTF-8

    ${resp} =   POST   ${urlapp}    data=${json_utf8}   expected_status=Anything

#    Log To Console    >>>>>>>>>${resp.json()}<<<<<<<<<<
     Log To Console     >>>>>>>>>${resp.status_code}<<<<<<<<<<
