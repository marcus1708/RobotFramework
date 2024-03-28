*** Settings ****
Library  RequestsLibrary
Library  OperatingSystem
Library  String

*** Keywords  ****

Cadastrar Produto no Carrinho
    [Arguments]  ${produto}  ${product_id}   ${token}   ${expected_status} 

    ${body}  Get File  path=${EXECDIR}/Json/carrinho_template.json
    ${body}  Replace String Using Regexp  ${body}   _product_id    ${product_id}
    ${body}  Replace String Using Regexp  ${body}  "_quantidade"   ${produto}[quantidade]  
    
    Log To Console     ${body}
    ${header}        Create Dictionary   Content-Type=application/json   Authorization=${token}

    ${response}      POST On Session   alias=server_rest  url=/carrinhos  headers=${header}
    ...              data=${body}  
    Log To Console   ${response.json()}
    Log To Console   ${response.json()['_id']}

    ${carrinho}   Set Variable  ${response.json()['_id']}

    [Return]      ${carrinho}
Buscar Carrinho  
    [Arguments]  ${carrinho_id}  ${produto}  ${expected_status}  ${token}

    ${header}        Create Dictionary   Content-Type=application/json   Authorization=${token}
    
    ${response}      GET On Session   alias=server_rest  url=/carrinhos/${carrinho_id}  headers=${header}
    ...              expected_status=${expected_status}
    
    Log To Console   ${response.json()}
    
    IF  ${expected_status} == 200
        ${preco}  Set Variable  ${produto}[preco]
        ${preco_total}  Set Variable  ${response.json()['precoTotal']}
        ${qtd}   Set Variable  ${response.json()['quantidadeTotal']}

        ${preco}  Convert To Number  ${preco}
        ${preco_total}  Convert To Number  ${preco_total}
        ${qtd}  Convert To Number  ${qtd}

        ${preco_total_calculado}   Evaluate    ${preco}*${qtd}

        Should Be Equal    ${preco_total_calculado}    ${preco_total}

    END

Realizar Compra
    [Arguments]  ${token}  ${expected_status}
    
    ${header}        Create Dictionary   Content-Type=application/json   Authorization=${token}
    
    ${response}      DELETE On Session   alias=server_rest  url=/carrinhos/concluir-compra/  headers=${header}
    ...              expected_status=${expected_status}
    
    Log To Console   ${response.json()}
    
Deletar Carrinho / Cancelar Compra
    [Arguments]  ${token}  ${expected_status}
    ${header}        Create Dictionary   Content-Type=application/json   Authorization=${token}
    ${response}      DELETE On Session   alias=server_rest  url=/carrinhos/cancelar-compra/  headers=${header}
    ...              expected_status=${expected_status}