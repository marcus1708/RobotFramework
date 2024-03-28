# AUTOMAÇÃO DA API DO SITE https=//serverest.dev/

*** Settings ***
Library     RequestsLibrary
Resource   ../Resource/User_resource.robot
Resource   ../Resource/Autenticacao_resource.robot
Resource   ../Resource/Product_resource.robot
Resource   ../Resource/Session_resource.robot

Suite Setup      Criar Sessão      https://serverest.dev   
Suite Teardown   Encerrar Sessão

*** Variables ***

&{produto_1}     nome=Tenis    preco=100  quantidade=50  descricao=Nike
&{produto_2}     nome=Tapete   preco=200  quantidade=40  descricao=Tapete sala
&{user}      nome=MARCUS   email=teste@teste.com  password=teste   administrador=true 

*** Test Cases ***
    
Teste Criaçao de Produto - Primeira Forma

   ${user_id}  Criação de usuário   ${user}
   ${token}  Autenticar Usuário  ${user.email}  ${user.password}
   Log To Console  Este é um token válido--> ${token}
   ${product_id}  Criar Produto   ${token}  produto_1        201
   Buscar Produto      ${token}    ${product_id}    200
   Atualizar Produto   ${token}    ${product_id}  produto_1
   Buscar Produto      ${token}    ${product_id}    200
   Deletar Produto     ${token}    ${product_id}
   Deletar Usuário     user_id=${user_id}

Teste Criaçao de Produto - Segunda Forma
   ${user_id}  Criação de usuário    ${user}
   ${token}    Autenticar Usuário    ${user.email}  ${user.password}
   ${product_id}  Criar Produto - 2  ${token}  ${produto_1}  201
   Buscar Produto          ${token}  ${product_id}  200
   Atualizar Produto 2     ${token}  ${product_id}  ${produto_2}
   Buscar Produto          ${token}  ${product_id}  200
   Deletar Produto         ${token}  ${product_id}
   Deletar Usuário         user_id=${user_id}
   