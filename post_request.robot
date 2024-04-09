*** Settings ***
Library	 RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${base_url}		        https://thetestingworldapi.com/

*** Test Cases ***
Validate response
    Create Session       AddData                    ${base_url}
    ${body}=             Create Dictionary          first_name=Testing middle_name=A last_name=World      data_of_birth=12/12/1990
    ${header}=           Create Dictionary          Content-Type=application/json

    ${response}=         Post Request               AddData                   api/studentsDetails/        data=${body}        headers=${header}
    ${code}=             Convert To String          ${response.status_code}
    Should Be Equal      ${code}                    201
    Log To Console       ${response.content}
