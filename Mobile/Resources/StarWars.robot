** Settings ***

Library  AppiumLibrary

***Variables***
${btn_del}=                          id=com.qaxperience.yodapp:id/btnRemove
*** Keywords ***

Acessa menu "Star Wars"
    Wait Until Page Contains         QAX
    Click Element                    //android.widget.Button[@text="QAX"]
    Wait Until Element Is Visible    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]   
    
    Click Element                    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]    
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/navView         
    
    Click Element                    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]/android.widget.FrameLayout[5]
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/toolbarTitle    
    Element Text Should Be           id=com.qaxperience.yodapp:id/toolbarTitle    Star Wars
Exclui um personagem    
    Click Element                    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Lista"]
    Swipe By Percent                 92.59    20.58    47.22    20.58
    Wait Until Element Is Visible    ${btn_del} 
    Click Element                    ${btn_del}
Busca um personagem
    Click Element                    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Busca"]
    Input Text                       id=com.qaxperience.yodapp:id/etSearch  Darth 
    Wait Until Page Contains         Darth Vader
Acessa um personagem
    Click Element                    xpath=(//android.widget.FrameLayout[@resource-id="com.qaxperience.yodapp:id/container"])[2]/android.view.ViewGroup
    Wait Until Page Contains         id=com.qaxperience.yodapp:id/textAboutExtended    Atraído para o lado negro da Força pelo Chanceler Sheev Palpatine/Darth Sidious e se torna um Lorde Sith.  
