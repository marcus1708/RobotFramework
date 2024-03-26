*** Settings ***

Documentation
Resource       ../Resource/amazon_resources.robot
Test Setup     Abrir o navegador
#Test Teardown  Fechar o navegador

*** Test Cases ***

Caso de teste 01 - Acessar o menu "Livros"
    [Documentation]
    [Tags]            menus  categorias
    Acessar a homepage do site Amazon.com
    Entrar com o menu Livros 
    Verificar se o título da página é "Loja de Livros"
