# AUTOMAÇÃO DA API DO SITE https://serverest.dev/

*** Settings ***
Library     RequestsLibrary
Resource   ../Resource/User_resource.robot

Suite Setup      Criar Sessão
Suite Teardown   Encerrar Sessão

*** Test Cases ***
Teste API - Usuario
   
    ${user_id}  Criação de usuário
    Buscar Usuário     user_id=${user_id}   
    Atualizar Usuário  user_id=${user_id}   
    Buscar Usuário     user_id=${user_id}   
    Deletar Usuário    user_id=${user_id}

 
