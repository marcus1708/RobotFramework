*** Settings ***

Resource       ../Resource/Serverest_resources.robot
Test Setup     Abrir o navegador
#Test Teardown  Fechar o navegador

*** Test Cases ***

Automação da pagina Web Serverest
    Cadastrar um novo usuário
    Preencher dados

