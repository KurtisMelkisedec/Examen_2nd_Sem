*** Settings ***
Library           AppiumLibrary

Variables        ../po/variables.py
Variables        ../po/locator.py


*** Keywords ***

Open Application MyApp
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appActivity=${APP_ACTIVITY}    noReset=true

Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${USERNAME}
    Click Element    locator=${USERNAME}
    Input Text    locator=${USERNAME}    text=${username}
Enter Password
    Wait Until Element Is Visible    ${PASSWORD}
    Click Element    locator=${PASSWORD}
    Input Text    locator=${PASSWORD}    text=m38rmF$
        
Press Login
    Wait Until Element Is Visible    ${LOGIN}
    Click Element    ${LOGIN}

Enter Product Title
    Wait Until Element Is Visible    locator=${PRODUCT_TITLE}
    Click Element    locator=${PRODUCT_TITLE}
    Input Text    locator=${PRODUCT_TITLE}    text=NIKE 20
Enter Product Price
    Wait Until Element Is Visible    locator=${PRODUCT_PRICE}
    Click Element    locator=${PRODUCT_PRICE}
    Input Text    locator=${PRODUCT_PRICE}    text=2000

Enter Product Desc
    Wait Until Element Is Visible    locator=${PRODUCT_DESC}
    Click Element    locator=${PRODUCT_DESC}
    Input Text    locator=${PRODUCT_DESC}    text=Une chaussure Nike nouvelle generation
    

Enter Product URL
    Wait Until Element Is Visible    locator=${PRODUCT_URL}
    Click Element    locator=${PRODUCT_URL}
    Input Text    locator=${PRODUCT_URL}    text=https://kurtismelkisoft.dev
Enter Product Categ
    Wait Until Element Is Visible    locator=${PRODUCT_CATEG}
    Click Element    locator=${PRODUCT_CATEG}
    Input Text    locator=${PRODUCT_CATEG}    text=Chaussure
Press Button Product
    Wait Until Element Is Visible    locator=${PRODUCT_BTN}
    Click Element    locator=${PRODUCT_BTN}

Click on Product
    Wait Until Element Is Visible    locator=${PRODUCT}
    Click Element    locator=${PRODUCT}



