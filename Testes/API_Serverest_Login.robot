# AUTOMAÇÃO DA API DO SITE https://serverest.dev/

*** Settings ***

Resource   ../Resource/User_resource.robot
Resource   ../Resource/Autenticacao_resource.robot
Resource   ../Resource/Session_resource.robot

Suite Setup      Criar Sessão      https://serverest.dev   
Suite Teardown   Encerrar Sessão

*** Variables ***

${login}    teste@teste.com
${senha}    teste
&{user}     nome=MARCUS   email=teste@teste.com  password=teste   administrador=true 

*** Test Cases ***
Teste API - Login

   ${user_id}  Criação de usuário   ${user}
   ${token}  Autenticar Usuário  ${user.email}  ${user.password}
   Deletar Usuário    user_id=${user_id} 