*** Settings ***
Library               RequestsLibrary
Library               Collections

*** Variables ***
${BASE_URL}           https://simple-books-api.glitch.me
${TOKEN}              0e125cc349707dd9368ed1135a6354b1d98f7bcd00d88b3ad8e40663857bb9b8

*** Test Cases ***
Authenticate and Make POST Request
    ${headers}      Create Dictionary   Authorization=Bearer ${TOKEN}  Content-Type=application/json
    ${payload}      Create Dictionary   bookId=1  customerName="John"
    ${response}     Post                ${BASE_URL}/orders  headers=${headers}  json=${payload}
    Log             ${response.text}
    Should Be Equal As Strings  201  ${response.status_code}
    Delete All Sessions
