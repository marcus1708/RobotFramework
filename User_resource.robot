# AUTOMAÇÃO DA API DO SITE https://serverest.dev/

*** Settings ***

Library  RequestsLibrary

*** Variables ***


${URL}       https://serverest.dev     
${DADOS}     {"nome": "MARCUS",
...          "email": "teste@teste.com",
...          "password": "teste",
...          "administrador": "true"}    

${DADOS2}    {"nome": "MARCUS",
...          "email": "teste2@teste.com",
...          "password": "teste",
...          "administrador": "true"}

*** Keywords ***

Criação de usuário
    ${header}        Create Dictionary  Content-Type=application/json  

    ${response}      POST On Session   alias=server_rest  url=/usuarios  headers=${header}
    ...              data=${DADOS}     expected_status=201

    ${user_id}       Set Variable     ${response.json()['_id']}
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
    DELETE On Session                 alias=server_rest  url=/usuarios/${user_id}  expected_status=200
Criar Sessão
  Create Session    url=${URL}   alias=server_rest
Encerrar Sessão
  Delete All Sessions   
