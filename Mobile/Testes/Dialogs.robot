***Settings***
Resource  ../resources/Resources.robot
Resource  ../resources/Dialogs.robot
*** Test Cases ***

Valida a tela inicial
    Open Session
    Tela inicial     
    Close Session
Clicar no sub-menu "Dialogs"
    Open Session
    Acessa menu "Dialogs"
    Close Session
Valida o item Dialogs 
    Open Session
    Acessa menu "Dialogs"
    Valida o Dialogs
    Close Session
