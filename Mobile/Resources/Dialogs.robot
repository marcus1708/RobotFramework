** Settings ***

Library  AppiumLibrary

*** Keywords ***

Acessa menu "Dialogs"
    Wait Until Page Contains         QAX
    Click Element                    //android.widget.Button[@text="QAX"]
    Wait Until Element Is Visible    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]   
    
    Click Element                    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]    
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/navView         
    
    Click Element                    xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id="com.qaxperience.yodapp:id/rvNavigation"]/android.widget.FrameLayout[4]
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/toolbarTitle    
    Element Text Should Be           id=com.qaxperience.yodapp:id/toolbarTitle    Dialogs
Valida o Dialogs 
    Click Element                    id=com.qaxperience.yodapp:id/tvItemTitle
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/dialogInfoText    
    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/dialogInfoSubtitle
    Click Element                    id=com.qaxperience.yodapp:id/dialogInfoOk

  
