*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${BASE_URL}           https://simple-books-api.glitch.me
${TOKEN}              YourAuthTokenHere

*** Test Cases ***
Authenticate and Make POST Request
    ${headers}      Create Dictionary   Authorization=Bearer ${TOKEN}  Content-Type=application/json
    ${payload}      Create Dictionary   bookId=1  customerName="John"
    ${response}     Post                ${BASE_URL}/orders  headers=${headers}  json=${payload}
    Log             ${response.text}
    Should Be Equal As Strings  201  ${response.status_code}
    Delete All Sessions
