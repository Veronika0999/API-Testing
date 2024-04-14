*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${url}      https://jsonplaceholder.typicode.com
${app}      /posts/1
${urlapp}   ${url}${app}


*** Test Cases ***
GET request
    ${response}             GET                         ${urlapp}
    Log To Console         ${response.status_code}
    Log To Console         ${response.content}
    Log To Console         ${response.headers}

Validations
    ${response}             GET                         ${urlapp}
    ${status_code}         convert to string            ${response.status_code}
    Should Be Equal        ${status_code}               200


    ${body}                 convert to string             ${response.content}
    Should Contain          ${body}                       1


    ${contentTypeValue}     Get From Dictionary     ${response.headers}     Content-Type
    Should Be Equal         ${contentTypeValue}     application/json; charset=utf-8
