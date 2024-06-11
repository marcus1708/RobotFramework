***Settings***
Resource  ../resources/Resources.robot
Resource  ../resources/StarWars.robot
*** Test Cases ***

Valida a tela inicial
    Open Session
    Tela inicial     
    Close Session
Clicar no sub-menu "Star Wars"
    Open Session
    Acessa menu "Star Wars"
    Close Session
Acessa a Lista e exclui um personagem
    Open Session
    Acessa menu "Star Wars"
    Exclui um personagem
    Close Session
Realiza a busca de um personagem
    Open Session
    Acessa menu "Star Wars"
    Busca um personagem
    Close Session
Acessa dados de um personagem
    Open Session
    Acessa menu "Star Wars"
    Acessa um personagem
    Close Session
