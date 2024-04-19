*** Settings ***
Library	    RequestsLibrary

*** Variables ***
${URL}                    https://api.spotify.com
${PLAYLIST_ID}            /v1/playlists/3cEYpjA9oz9GiPac4AsH4n
${URL_WITH_PLAYLIST_ID}   ${URL}${PLAYLIST_ID}
${access_token}           #YOUR TOKEN

*** Test Cases ***
Test with authhorization for Spotify
#request with Access Token
    ${headers}=         Create Dictionary  Authorization=Bearer ${access_token}
    ${resp} =           GET  ${URL_WITH_PLAYLIST_ID}  headers=${headers}  expected_status=200

#playlist
    Log To Console      ${resp.json()}[description]

