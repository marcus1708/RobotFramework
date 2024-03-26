# AUTOMAÇÃO DA API DO SITE https://serverest.dev/

*** Settings ***

Library  RequestsLibrary

*** Variables ***

*** Keywords ***

Autenticar Usuário
    [Arguments]      ${login}  ${senha}
    
    ${header}        Create Dictionary  Content-Type=application/json  

    ${response}      POST On Session   alias=server_rest   url=/login   headers=${header}
    ...              data={"email": "${login}", "password": "${senha}"}    expected_status=200
    
    Log To Console   ${response.json()}

    ${token}         Set Variable     ${response.json()['authorization']}
    Log To Console   ${token}
    
    [Return]         ${token}
