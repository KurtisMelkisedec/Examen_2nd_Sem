*** Settings ***
Library    AppiumLibrary


Variables        ../po/variables.py
Resource         ../resources/commont.robot


Suite Setup    Run Keyword    Open Application MyApp




***Test Cases***
Open Application and Login
    [Tags]     "init"
    Enter username johnd
    Enter Password
    Press Login
Open Application with wrong Login
    [Tags]     "init"
    Enter username kurtis
    Enter Password
    Press Login

Add Product
    Enter Product Title
    Enter Product Price
    Enter Product Desc
    Enter Product Categ
    Enter Product URL
    Press Button Product 

Show Product
    Click on Product
    
