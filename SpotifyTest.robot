*** Settings ***
Library	    RequestsLibrary

*** Variables ***
${URL}                  https://api.spotify.com
${ARTIST_ID}            /v1/playlists/3cEYpjA9oz9GiPac4AsH4n
${URL_WITH_ARTIST_ID}   ${URL}${ARTIST_ID}
${access_token}         #your token

*** Test Cases ***
Test with authhorization for Spotify
#request with Access Token
    ${headers}=         Create Dictionary  Authorization=Bearer ${access_token}
    ${resp} =           GET  ${URL_WITH_ARTIST_ID}  headers=${headers}  expected_status=200

#playlist
    Log To Console      ${resp.json()}[description]
