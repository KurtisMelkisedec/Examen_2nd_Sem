*** Settings ***
Library           RequestsLibrary
Resource    ./../resources/resources.robot
Suite Setup    Create Sessionttp



*** Test Cases ***
Get Orders Case
    Get Orders
    Get Order By Id    333

