# robot -d ./result -L trace ./Testes/API_Serverest_Carrinho.robot

*** Settings ***
Library     RequestsLibrary
Resource   ../Resource/User_resource.robot
Resource   ../Resource/Autenticacao_resource.robot
Resource   ../Resource/Product_resource.robot
Resource   ../Resource/Carrinho_resource.robot
Resource   ../Resource/Session_resource.robot

Suite Setup      Criar Sessão      https://serverest.dev   
Suite Teardown   Encerrar Sessão

*** Variables ***

&{produto}   nome=Tenis    preco=100  quantidade=50  descricao=Nike
&{user}      nome=MARCUS   email=teste@teste.com  password=teste   administrador=true 

*** Test Cases ***
    
Teste Carrinho

   ${user_id}  Criação de usuário  ${user}  
   ${token}  Autenticar Usuário    ${user.email}  ${user.password}    
   ${product_id}  Criar Produto - 2  ${token}  ${produto}  201
    
   ${carrinho_id}   Cadastrar Produto no Carrinho   ${produto}   ${product_id}   ${token}  201
   Buscar Carrinho    ${carrinho_id}   ${produto}    200   ${token}
   Realizar Compra    ${token}  200
   Deletar Carrinho / Cancelar Compra  ${token}   200
   Deletar Produto    ${token}   ${product_id}    
   Deletar Usuário    user_id=${user_id}  

