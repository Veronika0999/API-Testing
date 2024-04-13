*** Settings ***
Library           RequestsLibrary

*** Variables ***
${url}      https://jsonplaceholder.typicode.com
${app}      /posts
${urlapp}   ${url}${app}

*** Test Cases ***
GET request
    ${response}         GET             ${urlapp}
    Log To Console      ${response}

POST request
    API Communication    {"title":"foo", "body":"bar", "userId":"1"}    201

DELETE request
    ${response}         DELETE          ${urlapp}/1
    Log To Console      ${response}

*** Keywords ***
API Communication
    [Arguments]          ${json}          ${error_resp}
    ${resp} =            POST             ${urlapp}              data=${json}     expected_status=${error_resp}
