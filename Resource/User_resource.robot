# AUTOMAÇÃO DA API DO SITE https://serverest.dev/

*** Settings ***

Library  RequestsLibrary
Library  OperatingSystem
Library  String

*** Variables ***

${DADOS2}    {"nome": "MARCUS",
...          "email": "teste2@teste.com",
...          "password": "teste",
...          "administrador": "true"}

*** Keywords ***

Criação de usuário
    [Arguments]   ${user} 
    
    ${body}  Get File  path=${EXECDIR}/Json/user_template.json

    ${body}  Replace String Using Regexp  ${body}  _nome   ${user}[nome] 
    ${body}  Replace String Using Regexp  ${body}  _email   ${user}[email]  
    ${body}  Replace String Using Regexp  ${body}  _password   ${user}[password]  
    ${body}  Replace String Using Regexp  ${body}  _administrador  ${user}[administrador]

    ${header}        Create Dictionary   Content-Type=application/json  

    ${response}      POST On Session   alias=server_rest  url=/usuarios  headers=${header}
    ...              data=${body}      expected_status=201
    
    ${user_id}   Set Variable  ${response.json()['_id']}

    Log To Console   ${user_id}
    [Return]         ${user_id}
Buscar Usuário
    [Arguments]      ${user_id}
    ${response}      GET On Session   alias=server_rest    url=/usuarios/${user_id}   expected_status=200

    ${retorno_get}   Set Variable     ${response.json()}
    Log To Console   ${retorno_get}

Atualizar Usuário
    [Arguments]      ${user_id}
    ${header}        Create Dictionary  Content-Type=application/json 
    ${response}      PUT On Session     alias=server_rest  url=/usuarios/${user_id}  headers=${header}
    ...              data=${DADOS2}     expected_status=200
    
    ${retorno_put}   Set Variable     ${response.json()}
    Log To Console   ${retorno_put}
Deletar Usuário
    [Arguments]      ${user_id}
    DELETE On Session    alias=server_rest  url=/usuarios/${user_id}  expected_status=200

