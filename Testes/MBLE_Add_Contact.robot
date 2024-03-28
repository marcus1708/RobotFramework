*** Settings ***

Library    AppiumLibrary

*** Variables ***

${deviceName}        Mobile
${automationName}    uiautomator2
${platformName}      Android
${appPackage}        com.google.android.dialer
${appActivity}       com.google.android.dialer.extensions.GoogleDialtactsActivity
${url}               http://127.0.0.1:4723
${inpFirstName}      //android.widget.EditText[@text="First name"]
${inpLastName}       //android.widget.EditText[@text="Last name"]
${inpPhone}          //android.widget.EditText[@text="Phone"] 
${btnSave}           id=com.google.android.contacts:id/toolbar_button



*** Test Cases ***

Deverá cadastrar um contato na agenda
    Abrir Aplicativo
    Adicionar um contato
    Cadastrar um novo contato

*** Keywords ***

Abrir Aplicativo
    Open Application    ${url}    automationName=${automationName} 
    ...    platformName=${platformName}   appPackage=${appPackage}  
    ...    appActivity=${appActivity}   deviceName=${deviceName}

Adicionar um contato
    Click Element     //*[@text='Contacts']
    Wait Until Element is Visible   //*[@text='Create new contact']
    Click Element     //*[@text='Create new contact']

Cadastrar um novo contato
    Wait Until Element is Visible   ${inpFirstName}
    Input Text        ${inpFirstName}    Marcus
    Input Text        ${inpLastName}     Souza
    Input Text        ${inpPhone}        011979928332
    Click Element     ${btnSave}