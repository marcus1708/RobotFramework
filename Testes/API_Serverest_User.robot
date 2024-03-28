# AUTOMAÇÃO DA API DO SITE https://serverest.dev/

*** Settings ***
Library     RequestsLibrary
Resource   ../Resource/User_resource.robot
Resource   ../Resource/Session_resource.robot

Suite Setup      Criar Sessão      https://serverest.dev   
Suite Teardown   Encerrar Sessão
*** Variables ***

&{user}      nome=MARCUS   email=teste@teste.com  password=teste   administrador=true 

*** Test Cases ***
Teste API - Usuario
   
    ${user_id}  Criação de usuário  ${user}
    Buscar Usuário     user_id=${user_id}   
    Atualizar Usuário  user_id=${user_id}   
    Buscar Usuário     user_id=${user_id}   
    Deletar Usuário    user_id=${user_id}

 