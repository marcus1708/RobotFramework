*** Settings ***

Library  SeleniumLibrary

*** Variables ***
${URL}            https://front.serverest.dev/login


*** Keywords ***
Abrir o Navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o Navegador
    Close Browser

Cadastrar um novo usuário
    Go To   url=${URL}
    Title Should Be  title="Front - ServeRest"
    Click Element    locator = //*[@id="root"]/div/div/form/small/a
    Wait Until Page Contains  text=//*[@id="root"]/div/div/form/h2

Preencher dados
    Input Text    id="nome"      text= MARCUS
    Input Text    id="email"     text= teste@teste.com
    Input Text    id="password"  text= teste
    Select Checkbox    id="administrador"
Verificar se o título da página é "${TITULO}" 
    Wait Until Page Contains  text=${TITULO} 
    
