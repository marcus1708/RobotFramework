***Settings***
Resource  ../resources/Resources.robot
Resource  ../resources/Check e Radio.robot
*** Test Cases ***

Valida a tela inicial
    Open Session
    Tela inicial          
    Close Session
Clicar no sub-menu "Check e Radio"
    Open Session
    Acessa menu "Check e Radio"
    Close Session
Valido o Checkbox
    Open Session
    Acessa menu "Check e Radio"
    Acessa Checkbox
    Close Session
Valido o RadioButton
    Open Session
    Acessa menu "Check e Radio"
    Acessa Radio Button
    Close Session
