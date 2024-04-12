*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${BASE_URL}           https://simple-books-api.glitch.me
${TOKEN}              YourAuthTokenHere

*** Test Cases ***
API Communication Test for Book Retrieval
    API Comunication  {"id":2,"name":"Just as I Am","author":"Cicely Tyson","type":"non-fiction","price":20.33,"current-stock":0,"available":false}  200

*** Keywords ***
API Comunication
    [Arguments]       ${json}         ${error_resp}
    ${headers}=       Create Dictionary   Authorization=Bearer ${TOKEN}      Content-Type=application/json
    ${resp}=          GET          ${BASE_URL}/books/2      data=${json}     expected_status=${error_resp}
    Should Be Equal As Integers    ${error_resp}     ${resp.status_code}
