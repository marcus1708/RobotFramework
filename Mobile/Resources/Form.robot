** Settings ***

Library  AppiumLibrary

***Variables***
${btn_del}           id=com.qaxperience.yodapp:id/btnRemove
${Nome}              id=com.qaxperience.yodapp:id/etUsername
${Email}             id=com.qaxperience.yodapp:id/etEmail
${Senha}             id=com.qaxperience.yodapp:id/etPassword
${spinner}           id=com.qaxperience.yodapp:id/spinnerJob
${list_view}         class=android.widget.ListView
*** Keywords ***

Acessa menu "Formularios"
    Wait Until Page Contains         QAX
    Click Element                    //android.widget.Button[@text="QAX"]
    Wait Until Element Is Visible    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]   
    
    Click Element                    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]    
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/navView         
    
    Click Element                    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]/android.widget.FrameLayout[3]
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/toolbarTitle    
    Element Text Should Be           id=com.qaxperience.yodapp:id/toolbarTitle    Formulários
Realiza o Login   
    Click Element                    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Login"]
    Wait Until Page Contains         Olá Padawan, vamos testar o login?
    Input Text                       ${Email}   qa@qa.io
    Input Text                       ${Senha}   QA@123  
    Click Element                    id=com.qaxperience.yodapp:id/btnSubmit
Realiza o Cadastro
    Click Element                    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Cadastro"]
    Wait Until Page Contains         Crie sua conta.
    Input Text                       ${Nome}    QA 
    Input Text                       ${Email}   qa@qa.io
    Input Text                       ${Senha}   QA@123  
    Click Element                    ${spinner}
    Wait Until Element Is Visible    ${list_view}
    Click Text                       Jedi
    Click Element                    id=com.qaxperience.yodapp:id/btnSubmit
