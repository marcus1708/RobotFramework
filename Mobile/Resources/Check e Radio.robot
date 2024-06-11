** Settings ***

Library  AppiumLibrary

*** Keywords ***

Acessa menu "Check e Radio"
    Wait Until Page Contains         QAX
    Click Element                    //android.widget.Button[@text="QAX"]
    Wait Until Element Is Visible    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]   
    
    Click Element                    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]    
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/navView         
    
    Click Element                    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]/android.widget.FrameLayout[2]
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/toolbarTitle  
    Element Text Should Be           id=com.qaxperience.yodapp:id/toolbarTitle    Check e Radio
Acessa Checkbox
    ${element}=                      Set Variable     xpath=//android.widget.CheckBox[@resource-id="com.qaxperience.yodapp:id/checkboxButton" and @text="Robot Framework "]
    Click Element                    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Checkbox"]
    Wait Until Element Is Visible    ${element}
    Click Element                    ${element}
    Element Attribute Should Match    ${element}    checked    true
Acessa Radio Button
    ${element}=                      Set Variable     xpath=//android.widget.RadioButton[@resource-id="com.qaxperience.yodapp:id/radioButton" and @text="Python "]
    Click Element                    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Botões de radio"] 
    # texto: Escolha sua linguagem preferida
    Wait Until Element Is Visible    ${element}
    Click Element                    ${element}
    Element Attribute Should Match   ${element}    checked    true
