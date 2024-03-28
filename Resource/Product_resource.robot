# AUTOMAÇÃO DA API DO SITE https://serverest.dev/

*** Settings ***

Library  RequestsLibrary
Library  OperatingSystem
Library  String

*** Variables ***

*** Keywords ***
Criar Produto
    [Arguments]   ${token}   ${file}   ${expected_status} 

    IF  "${file}" == "produto_1"
        Log To Console    ${EXECDIR}
        ${body}  Get File  path=${EXECDIR}/Json/produto_1.json
    ELSE IF   "${file}" == "produto_2"
        Log To Console    ${EXECDIR}
        ${body}  Get File  path=${EXECDIR}/Json/produto_2.json
    END
    Log To Console   ${body}

    ${header}        Create Dictionary  Content-Type=application/json   Authorization=${token}

    ${response}      POST On Session   alias=server_rest  url=/produtos  headers=${header}
    ...              data=${body}     expected_status=201
    
    Log To Console   ${response.json()}
    Log To Console   ${response.json()['_id']}

    ${product_id}    Set Variable  ${response.json()['_id']}
    Log To Console   ${product_id}
    [Return]         ${product_id}

Buscar Produto
    [Arguments]      ${auth_token}   ${product_id}   ${expected_status} 
    
    ${header}        Create Dictionary  Content-Type=application/json   Authorization=${auth_token}

    ${response}      GET On Session   alias=server_rest  url=/produtos/${product_id}  headers=${header}
    ...              expected_status=${expected_status}
    
    Log To Console   ${response.json()}

Atualizar Produto
    [Arguments]   ${auth_token}   ${product_id}   ${file}  
    
    ${header}     Create Dictionary  Content-Type=application/json   Authorization=${auth_token}

    IF  "${file}" == "produto_1"
        Log To Console    ${EXECDIR}
        ${body}  Get File  path=${EXECDIR}/Json/produto_1.json
    ELSE IF   "${file}" == "produto_2"
        Log To Console    ${EXECDIR}
        ${body}  Get File  path=${EXECDIR}/Json/produto_2.json
    END
    Log To Console   ${body}
    
    ${response}      PUT On Session   alias=server_rest  url=/produtos/${product_id}  headers=${header}
    ...              data=${body}     expected_status=200
    
    ${retorno_put}   Set Variable     ${response.json()}
    Log To Console   ${retorno_put}

Deletar Produto
    [Arguments]      ${auth_token}       ${product_id} 
   
    ${header}        Create Dictionary   Content-Type=application/json   Authorization=${auth_token}
    
    ${response}      DELETE On Session   alias=server_rest  url=/produtos/${product_id}  headers=${header}
    ...              expected_status=200
    
    Log To Console   ${response.json()}
    Buscar Produto   ${auth_token}   ${product_id}  400
Criar Produto - 2
    
    [Arguments]   ${token}   ${file}   ${expected_status}

    ${body}  Get File  path=${EXECDIR}/Json/product_template.json

    ${body}  Replace String Using Regexp  ${body}  _nome   ${file}[nome] 
    ${body}  Replace String Using Regexp  ${body}  "_preco"   ${file}[preco]  
    ${body}  Replace String Using Regexp  ${body}  "_quantidade"  ${file}[quantidade]  
    ${body}  Replace String Using Regexp  ${body}  _descricao  ${file}[descricao]
 
    Log To Console  ${body}

    ${header}        Create Dictionary   Content-Type=application/json   Authorization=${token}

    ${response}      POST On Session   alias=server_rest  url=/produtos  headers=${header}
    ...              data=${body}      expected_status=201
    
    Log To Console   ${response.json()}
    Log To Console   ${response.json()['_id']}
    ${product_id}    Set Variable  ${response.json()['_id']}
    [Return]         ${product_id}

Atualizar Produto 2
    [Arguments]      ${auth_token}    ${product_id}    ${file}
    
    ${header}        Create Dictionary   Content-Type=application/json   Authorization=${auth_token}

    ${body}  Get File  path=${EXECDIR}/Json/product_template.json
    ${body}  Replace String Using Regexp  ${body}   _nome          ${file}[nome] 
    ${body}  Replace String Using Regexp  ${body}  "_preco"        ${file}[preco]  
    ${body}  Replace String Using Regexp  ${body}  "_quantidade"   ${file}[quantidade]  
    ${body}  Replace String Using Regexp  ${body}  _descricao      ${file}[descricao]

    Log To Console   ${body}

    ${response}      PUT On Session   alias=server_rest  url=/produtos/${product_id}  headers=${header}
    ...              data=${body}     expected_status=200
    
    ${retorno_put}   Set Variable     ${response.json()}
    Log To Console   ${retorno_put} 