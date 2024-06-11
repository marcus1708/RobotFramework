***Settings***
Resource  ../resources/Resources.robot
Resource  ../resources/Clique.robot
*** Test Cases ***

Valida a tela inicial
    Open Session
    Tela inicial          
    Close Session
Clicar no sub-menu "Clicar em Botões"
    Open Session
    Acessa menu "Clicar em Botões"
    Close Session
Realiza um clique simples
    Open Session
    Acessa menu "Clicar em Botões"
    Clique simples
    Close Session
Realiza um clique longo
    Open Session
    Acessa menu "Clicar em Botões"
    Clique longo
    Close Session
