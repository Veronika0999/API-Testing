*** Settings ***
Library	 RequestsLibrary

*** Test Cases ***
Get students details
    ${response}       GET       https://thetestingworldapi.com/api/studentsDetails
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
