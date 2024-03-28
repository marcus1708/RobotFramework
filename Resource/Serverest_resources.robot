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
    Title Should Be  title=Front - ServeRest
    Click Element    locator=//*[@id="root"]/div/div/form/small/a

Preencher dados
    Input Text    locator=//*[@id="nome"]      text= "MARCUS"
    Input Text    locator=//*[@id="email"]     text= "teste@teste.com"
    Input Text    locator=//*[@id="password"]      text= "teste"
    Select Checkbox    locator=//*[@id="administrador"]
    #Click Button  locator =//*[@id="cadastrar"]
   
    
