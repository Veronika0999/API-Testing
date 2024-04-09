*** Settings ***
Library	 RequestsLibrary

*** Variables ***
${base_url}		        https://thetestingworldapi.com/
${studentID}            28
*** Test Cases ***
Validate response
    Create Session       FetchData           ${base_url}
    ${Response}=         Get Request         FetchData           api/studentsDetails/${studentID}
    ${actual_code}=      Convert To String    ${Response.status_code}
    Should Be Equal      ${actual_code}                200
