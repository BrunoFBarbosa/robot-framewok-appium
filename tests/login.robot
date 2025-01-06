*** Settings ***

Resource    ../resources/base.resource.robot

Test Setup    Start Session
Test Teardown    Finish Session

*** Test Cases ***

Login Successful
    
    Login Into Application
    Wait Until Page Contains    Minhas tarefas
