*** Settings ***
Library    SeleniumLibrary
Resource   ../ressources/customer.robot
Suite Setup        Ouverture du navigateur
Suite Teardown        Fermer le navigateur

*** Test Cases ***
Cas 1 - Home page should load
    [Tags]    formulaire    smoke
                Verifier la page 
Cas 2 - Login should succeed with valid credentials
    [Tags]    formulaire    smoke
                Remplir le formulaire
Cas 3 - Login should fail with missing credentials
    [Tags]    formulaire    Functional
              Ne pas remplir le formulaire

Cas 4 - Remember me checkbox should persist email address
    [Tags]    formulaire    Functional
              Remplir le formulaire avec remember
              Se deconnecter puis se reconnecter 
            
Cas 5 - Should be able to log out
    [Tags]    formulaire    Functional
              Remplir le formulaire puis se deconnecter

Cas 6 - Customers page should display multiple customers
    [Tags]    formulaire    smoke
              Se connecter et verifier
              
Cas 7 - Should be able to add new customer
    [Tags]    formulaire    smoke                
                Remplir le costumer formulaire

Cas 8 - Should be able to cancel adding new customer
    [Tags]    formulaire    Functional                
                Annuler l'ajout d'un utilisateur
