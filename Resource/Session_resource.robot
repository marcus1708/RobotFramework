*** Settings ****
Library  RequestsLibrary
 
*** Keywords  ****

Criar Sessão
  [Arguments]     ${URL}
  Create Session    url=${URL}   alias=server_rest  verify=true
Encerrar Sessão
  Delete All Sessions   