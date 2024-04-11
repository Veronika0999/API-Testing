*** Settings ***
Library               RequestsLibrary

*** Test Cases ***
Get Request With Parameters Test
      ${response}=    GET  https://simple-books-api.glitch.me/books         expected_status=200

Get A JSON Body Test
      ${response}=    GET  https://simple-books-api.glitch.me/books/2

#check if the 'id' in the JSON response is equal to 2 (extract key 'id' and read it value, which should be 2)
     Should Be Equal As Strings    2    ${response.json()}[id]

#check if the 'name' in the JSON response is equal to the 'Just as I am' (extract key 'name' and read it value, which should be Just as I Am)
      Should Be Equal As Strings    Just as I Am    ${response.json()}[name]
