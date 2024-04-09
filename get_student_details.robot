*** Settings ***
Library	 RequestsLibrary

*** Variables ***
${base_url}		        https://thetestingworldapi.com/

*** Test Cases ***
Get students details
    Create Session    myssion           ${base_url}
    ${response}=      Get Request       myssion    api/studentsDetails
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
