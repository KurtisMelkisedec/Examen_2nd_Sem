*** Settings ***
Library     SeleniumLibrary
Library     Dialogs
Variables   ../pageobject/locator.py
Variables   ../pageobject/variables.py



*** Keywords ***
Ouverture du navigateur
    Open Browser    ${URL}    ${BROWSER}
    Wait Until Page Contains    Customers Are Priority One!

Verifier la page 
    Page Should Contain    Customers Are Priority One!  

Remplir le formulaire
    Click Link    ${LOGIN}    
    Input Text    ${EMAIL_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Sleep    2s       


Ne pas remplir le formulaire
    Click Link    ${LOGIN}
    Click Button    ${SUBMIT_BUTTON}
    Sleep    2s    

Remplir le formulaire avec remember   
    Click Link    ${LOGIN}    
    Input Text    ${EMAIL_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Select Checkbox    ${REMEMBER}
    Click Button    ${SUBMIT_BUTTON} 
    Sleep    5s  

Se deconnecter puis se reconnecter 
    Click Link    ${LOGOUT}
    Sleep    5s 
    Click Link    ${LOGIN_2}
    Sleep    5s
    Click Button    ${SUBMIT_BUTTON}
     Sleep    3s 

Remplir le formulaire puis se deconnecter
    Click Link    ${LOGIN}    
    Input Text    ${EMAIL_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Sleep    5s
    Click Link    ${LOGOUT} 
    Sleep    3s

Se connecter et verifier
    Click Link    ${LOGIN}    
    Input Text    ${EMAIL_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    xpath=//table[@id='customers']//tbody/tr
    ${rows}=    Get Element Count    xpath=//table[@id='customers']//tbody/tr  
    Should Be True    ${rows} > 1
    Sleep    3s

Remplir le costumer formulaire
    Click Link    ${LOGIN}    
    Input Text    ${EMAIL_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Sleep    5s 
    Click Link    ${NEW_CUSTOMER}    
    Input Text    ${EMAIL_CUS}    ${EMAIL}
    Input Text    ${FN_CUS}    ${FIRST_NAME}
    Input Text    ${LN_CUS}    ${LAST_NAME}
    Input Text    ${CITY}    ${SELECTED_CITY}
    Select From List By Label    ${STATE}    ${SELECTED_STATE}
    Select Radio Button    gender    ${SELECTED_GENDER}
    Select Checkbox    ${PROMO} 
    Click Button    ${SUBMIT_CUS}
    Sleep    2s 

Annuler l'ajout d'un utilisateur
    Click Link    ${LOGIN}    
    Input Text    ${EMAIL_INPUT}    ${USERNAME}
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Sleep    5s 
    Click Link    ${NEW_CUSTOMER}
    Sleep    2s 
    Click Link    ${CANCEL}
    Sleep    5s 


    

Fermer le navigateur
    Close Browser
    Sleep    2s   
