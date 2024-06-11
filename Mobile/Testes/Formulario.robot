***Settings***
Resource  ../resources/Resources.robot
Resource  ../resources/Form.robot
*** Test Cases ***

Valida a tela inicial
    Open Session
    Tela inicial     
    Close Session
Clicar no sub-menu "Formularios"
    Open Session
    Acessa menu "Formularios"
    Close Session
Realiza o Cadastro pelo app
    Open Session
    Acessa menu "Formularios"
    Realiza o Cadastro
    Close Session
Realiza o Login no app
    Open Session
    Acessa menu "Formularios"
    Realiza o Login  
    Close Session
