*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}            https://www.amazon.com.br
${HEADER_LIVROS}  //*[@id="nav-xshop"]/a[5]
${TEXTO}          Livros | Amazon.com.br

*** Keywords ***
Abrir o Navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o Navegador
    Close Browser

Acessar a homepage do site Amazon.com
    Go To   url=${URL}
    Wait Until Element Is Visible    locator=${HEADER_LIVROS}

Entrar com o menu ${LIVROS} 
    Click Element    locator=${HEADER_LIVROS}

Verificar se o título da página é "${TITULO}" 
    Wait Until Page Contains  text=${TITULO} 
    Title Should Be  title=${TEXTO}
