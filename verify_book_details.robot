*** Settings ***
Library               RequestsLibrary

*** Test Cases ***
Get Request With Parameters Test
      ${response}=    GET  https://simple-books-api.glitch.me/books         expected_status=200

Get A JSON Body Test
      ${response}=    GET  https://simple-books-api.glitch.me/books/2

#json
      Log To Console    >>>>>${response.json()}<<<<<

#check if the 'id' in the JSON response is equal to 2 (extract key 'id' and read it value, which should be 2)
     Should Be Equal As Strings    2    ${response.json()}[id]

#check if the 'name' in the JSON response is equal to the 'Just as I am' (extract key 'name' and read it value, which should be Just as I Am)
      Should Be Equal As Strings    Just as I Am    ${response.json()}[name]

#returns True if status_code is less than 400, False if not
      Log To Console    >>>>>${response.ok}<<<<<

#use for example authentication
      Log To Console    >>>>>${response.headers}<<<<<
      
#reason = OK and status_code = 200
      Log To Console    >>>>>${response.reason}<<<<<
      Log To Console    >>>>>${response.status_code}<<<<<

#text
      Log To Console    >>>>>${response.text}<<<<<
